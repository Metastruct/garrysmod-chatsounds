#!/usr/bin/env python3
"""
chatsounds-dedupe -- find duplicate sound files that survived re-encoding.

Generic dedupers (fdupes/rdfind) only catch byte-identical files. Most duplicates
in a community sound repo are the same audio re-encoded at a different bitrate,
sample rate, or with different padding, so the bytes never match.

Three tiers, cheapest first:
  exact-bytes  sha256 of the file
  exact-audio  sha256 of the decoded PCM (re-mux / metadata-only differences)
  perceptual   cosine similarity of a 32x32 log-mel fingerprint, gated on
               near-equal duration

Requires: ffmpeg on PATH, numpy.

  python3 chatsounds_dedupe.py sound/ -o duplicates.tsv

Fingerprints are cached in an .npz keyed by file *content*, so re-runs only
process new or changed files. (Content, not mtime -- a fresh git checkout
rewrites every mtime, which would invalidate the whole cache in CI.)

  --only PATHFILE   fingerprint everything, but only report clusters that
                    involve one of the listed files. Used by the PR check to
                    ask "do the sounds this PR adds already exist?".
"""
import argparse, hashlib, json, os, re, subprocess, sys
from collections import defaultdict
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor

import numpy as np

# --- analysis constants (calibrated) ---
SR = 22050          # working sample rate
N_FFT, HOP = 1024, 256
N_MELS, T_FRAMES = 32, 32
FMIN, FMAX = 50, 5000   # 5 kHz cap so 11.025 kHz clips (Nyquist 5512) still
                        # compare fairly against 44.1 kHz originals
TRIM_DB = -45.0         # silence trim threshold, relative to peak
AUDIO_EXT = (".ogg", ".wav", ".mp3", ".flac", ".m4a", ".aac", ".opus", ".wma")


# ---------------------------------------------------------------- fingerprint
def _mel_filterbank():
    hz2mel = lambda f: 2595.0 * np.log10(1.0 + f / 700.0)
    mel2hz = lambda m: 700.0 * (10 ** (m / 2595.0) - 1.0)
    mels = np.linspace(hz2mel(FMIN), hz2mel(FMAX), N_MELS + 2)
    bins = np.clip(np.floor((N_FFT + 1) * mel2hz(mels) / SR).astype(int), 0, N_FFT // 2)
    fb = np.zeros((N_MELS, N_FFT // 2 + 1), dtype=np.float32)
    for i in range(N_MELS):
        l, c = bins[i], max(bins[i + 1], bins[i] + 1)
        r = min(max(bins[i + 2], c + 1), N_FFT // 2)
        if c > r:
            continue
        fb[i, l:c] = np.linspace(0, 1, c - l, endpoint=False)
        fb[i, c:r] = np.linspace(1, 0, r - c, endpoint=False)
    return fb


FB = _mel_filterbank()
WIN = np.hanning(N_FFT).astype(np.float32)


def _decode(path):
    p = subprocess.run(
        ["ffmpeg", "-v", "quiet", "-i", path, "-f", "f32le", "-ac", "1", "-ar", str(SR), "-"],
        capture_output=True,
    )
    if p.returncode != 0 or not p.stdout:
        return None
    return np.frombuffer(p.stdout, dtype=np.float32)


def _trim(x):
    peak = np.abs(x).max() if x.size else 0.0
    if peak <= 0:
        return x
    idx = np.flatnonzero(np.abs(x) > peak * 10 ** (TRIM_DB / 20))
    return x[idx[0]: idx[-1] + 1] if idx.size else x


def _logmel(x):
    if x.size < N_FFT:
        x = np.pad(x, (0, N_FFT - x.size))
    n = 1 + (x.size - N_FFT) // HOP
    fr = np.lib.stride_tricks.as_strided(
        x, shape=(n, N_FFT), strides=(x.strides[0] * HOP, x.strides[0]))
    spec = np.abs(np.fft.rfft(fr * WIN, axis=1)) ** 2
    return np.log10(spec.astype(np.float32) @ FB.T + 1e-10)


def content_hash(path):
    h = hashlib.blake2b(digest_size=16)
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def fingerprint(path):
    """-> (path, file_hash, pcm_hash, duration, trimmed_duration, unit_vector)."""
    try:
        fh = content_hash(path)
        x = _decode(path)
    except Exception:
        return path, None, None, 0.0, 0.0, None
    if x is None or x.size == 0:
        return path, fh, None, 0.0, 0.0, None
    pcm_hash = hashlib.sha256(np.ascontiguousarray(x).tobytes()).hexdigest()[:32]
    xt = _trim(x)
    if xt.size < 512:
        xt = x
    m = _logmel(xt)
    t = m.shape[0]
    src = np.linspace(0, t - 1, T_FRAMES)
    i0 = np.floor(src).astype(int)
    i1 = np.minimum(i0 + 1, t - 1)
    w = (src - i0)[:, None].astype(np.float32)
    v = (m[i0] * (1 - w) + m[i1] * w).reshape(-1)
    v -= v.mean()
    nrm = np.linalg.norm(v)
    if nrm > 0:
        v /= nrm
    return path, fh, pcm_hash, x.size / SR, xt.size / SR, v.astype(np.float32)


# ---------------------------------------------------------------------- cache
def build_cache(root, cache_path, jobs):
    files = sorted(
        os.path.join(dp, f)
        for dp, _, fns in os.walk(root)
        for f in fns
        if f.lower().endswith(AUDIO_EXT)
    )
    if not files:
        sys.exit(f"no audio files found under {root}")

    # Materialise each cached array EXACTLY once. Indexing an npz member inside
    # a loop re-decompresses the whole array on every access, and the resulting
    # row is a view that pins its parent alive -- that combination will exhaust
    # any amount of RAM. Store row indices here and slice at the end instead.
    old, c_vecs = {}, None
    if cache_path and os.path.exists(cache_path):
        with np.load(cache_path, allow_pickle=True) as d:
            c_fh = d["fhash"]
            c_pcm = d["pcm"]
            c_dur = d["dur"]
            c_tdur = d["tdur"]
            c_vecs = d["vecs"]
        for i in range(len(c_fh)):
            old[str(c_fh[i])] = (str(c_pcm[i]), float(c_dur[i]),
                                 float(c_tdur[i]), i)

    # Hash first (cheap, I/O bound) so the cache can be keyed on content.
    with ThreadPoolExecutor(max_workers=min(16, (jobs or 4) * 2)) as ex:
        hashes = list(ex.map(lambda p: (p, _safe_hash(p)), files))
    fh_of = {p: h for p, h in hashes if h}

    todo = [p for p in files if fh_of.get(p) not in old]
    print(f"{len(files)} files; {len(todo)} to fingerprint "
          f"({len(files) - len(todo)} cached)", file=sys.stderr)

    rows, failed = {}, []
    if todo:
        with ProcessPoolExecutor(max_workers=jobs) as ex:
            for i, (p, fh, h, dur, td, v) in enumerate(
                    ex.map(fingerprint, todo, chunksize=32)):
                if v is None:
                    failed.append(p)
                else:
                    rows[p] = (fh, h, dur, td, v)
                if i and i % 2000 == 0:
                    print(f"  {i}/{len(todo)}", file=sys.stderr, flush=True)

    for p in files:
        if p not in rows:
            e = old.get(fh_of.get(p))
            if e:
                rows[p] = (fh_of[p], e[0], e[1], e[2], c_vecs[e[3]])

    paths = [p for p in files if p in rows]
    data = dict(
        paths=np.array(paths),
        fhash=np.array([rows[p][0] for p in paths]),
        pcm=np.array([rows[p][1] for p in paths]),
        dur=np.array([rows[p][2] for p in paths], dtype=np.float32),
        tdur=np.array([rows[p][3] for p in paths], dtype=np.float32),
        vecs=np.stack([rows[p][4] for p in paths]),
    )
    if cache_path:
        np.savez_compressed(cache_path, **data)
    for p in failed:
        print(f"UNREADABLE\t{p}", file=sys.stderr)
    if failed:
        print(f"{len(failed)} file(s) could not be decoded (likely corrupt)",
              file=sys.stderr)
    return data, failed


def _safe_hash(p):
    try:
        return content_hash(p)
    except OSError:
        return None


# -------------------------------------------------------------------- cluster
class DSU:
    def __init__(self, n):
        self.p = list(range(n))

    def find(self, x):
        while self.p[x] != x:
            self.p[x] = self.p[self.p[x]]
            x = self.p[x]
        return x

    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.p[rb] = ra


RANK = {"perceptual": 0, "exact-audio": 1, "exact-bytes": 2}


def cluster(data, thr, dur_tol, block=1024):
    order = np.argsort(data["tdur"], kind="stable")
    P, FH, PCM = data["paths"][order], data["fhash"][order], data["pcm"][order]
    D, T = data["dur"][order], data["tdur"][order]
    V = np.ascontiguousarray(data["vecs"][order].astype(np.float32))
    n = len(P)
    size = np.array([os.path.getsize(p) if os.path.exists(p) else 0 for p in P])

    dsu, best = DSU(n), {}

    def link(i, j, t):
        dsu.union(i, j)
        r = dsu.find(i)
        if RANK[t] > RANK.get(best.get(r, "perceptual"), -1) or r not in best:
            best[r] = t

    for key, tier in ((FH, "exact-bytes"), (PCM, "exact-audio")):
        g = defaultdict(list)
        for i, h in enumerate(key):
            if h:
                g[h].append(i)
        for ids in g.values():
            for j in ids[1:]:
                link(ids[0], j, tier)

    # Only a band of the similarity matrix can match, since duplicates must have
    # near-equal duration and rows are duration-sorted. O(n*w) instead of O(n^2).
    for s in range(0, n, block):
        e = min(s + block, n)
        hi = max(int(np.searchsorted(T, T[e - 1] * dur_tol, side="right")), e)
        sim = V[s:e] @ V[s:hi].T
        ii, jj = np.nonzero(sim >= thr)
        gi, gj = ii + s, jj + s
        m = gi < gj
        gi, gj = gi[m], gj[m]
        if gi.size:
            a, b = T[gi], T[gj]
            ok = (np.maximum(a, b) / np.maximum(np.minimum(a, b), 1e-6)) <= dur_tol
            for x, y in zip(gi[ok], gj[ok]):
                link(int(x), int(y), "perceptual")
        print(f"  matching {e}/{n}", file=sys.stderr, end="\r", flush=True)
    print(file=sys.stderr)

    groups = defaultdict(list)
    for i in range(n):
        groups[dsu.find(i)].append(i)

    out = []
    for r, ids in groups.items():
        if len(ids) < 2:
            continue
        # keep the largest file: highest bitrate is the best master to retain
        ids.sort(key=lambda i: (-size[i], str(P[i])))
        out.append({
            "tier": best.get(r, "perceptual"),
            "cross_folder": len({os.path.dirname(str(P[i])) for i in ids}) > 1,
            "keep": str(P[ids[0]]),
            "dupes": [str(P[i]) for i in ids[1:]],
            "n": len(ids),
            "dur": round(float(D[ids[0]]), 2),
            "reclaim_bytes": int(size[ids[1:]].sum()),
        })
    out.sort(key=lambda c: -c["reclaim_bytes"])
    return out


# --------------------------------------------------------------------- report
CATS = ["SAFE-identical-audio", "REVIEW-cross-folder",
        "REVIEW-same-folder", "CAREFUL-numbered-alternates"]


def categorise(c):
    if c["tier"] in ("exact-bytes", "exact-audio"):
        return CATS[0]
    if c["cross_folder"]:
        return CATS[1]
    names = [os.path.basename(x) for x in [c["keep"]] + c["dupes"]]
    if len({re.sub(r"[\s_]*\d+(?=\.[^.]+$)", "", n) for n in names}) == 1:
        return CATS[3]          # numbered alternates are often deliberate variety
    return CATS[2]


def write_tsv(clusters, path, root):
    rows = []
    for c in clusters:
        cat = categorise(c)
        for d in c["dupes"]:
            rows.append((cat, c["tier"], f"{c['dur']:.2f}",
                         os.path.relpath(c["keep"], root),
                         os.path.relpath(d, root), str(c["reclaim_bytes"])))
    rows.sort(key=lambda r: (CATS.index(r[0]), r[3]))
    with open(path, "w") as f:
        f.write("category\ttier\tdur_s\tkeep\tduplicate\tbytes\n")
        for r in rows:
            f.write("\t".join(r) + "\n")
    return rows


def write_markdown(clusters, path, root, failed, only=None, limit=60):
    counts = defaultdict(int)
    for c in clusters:
        counts[categorise(c)] += c["n"] - 1
    total = sum(c["n"] - 1 for c in clusters)
    mb = sum(c["reclaim_bytes"] for c in clusters) / 1e6

    L = []
    if only is not None:
        if not clusters:
            L.append("### ✅ No duplicates found\n")
            L.append(f"None of the {only} sound file(s) added by this PR match "
                     "anything already in the library.\n")
        else:
            L.append(f"### ⚠️ {total} possible duplicate(s) in this PR\n")
            L.append(f"{only} sound file(s) added; "
                     f"{len(clusters)} match existing library content.\n")
    else:
        L.append("### Duplicate sound report\n")
        L.append(f"**{len(clusters)}** clusters · **{total}** redundant files · "
                 f"**{mb:.1f} MB** reclaimable\n")
        L.append("| Category | Files | Meaning |")
        L.append("|---|--:|---|")
        meaning = {
            CATS[0]: "Byte- or PCM-identical. Safe to remove.",
            CATS[1]: "Same audio in a different folder. Review.",
            CATS[2]: "Same audio, same folder. Review.",
            CATS[3]: "Numbered alternates — may be deliberate variety.",
        }
        for k in CATS:
            if counts[k]:
                L.append(f"| `{k}` | {counts[k]} | {meaning[k]} |")
        L.append("")

    if clusters:
        L.append(f"<details><summary>Details (showing up to {limit})</summary>\n")
        L.append("| Category | Dur | Keep | Duplicate |")
        L.append("|---|--:|---|---|")
        shown = 0
        for c in clusters:
            if shown >= limit:
                break
            cat = categorise(c)
            for d in c["dupes"]:
                if shown >= limit:
                    break
                L.append(f"| {cat} | {c['dur']:.1f}s | "
                         f"`{os.path.relpath(c['keep'], root)}` | "
                         f"`{os.path.relpath(d, root)}` |")
                shown += 1
        if shown < total:
            L.append(f"\n_…and {total - shown} more — see the `duplicate-report` artifact._")
        L.append("\n</details>")

    if failed:
        L.append(f"\n<details><summary>⚠️ {len(failed)} undecodable file(s)</summary>\n")
        for p in failed[:20]:
            L.append(f"- `{os.path.relpath(p, root)}`")
        L.append("\n</details>")

    md = "\n".join(L) + "\n"
    with open(path, "w") as f:
        f.write(md)
    return md


# ------------------------------------------------------------------------ cli
def main():
    ap = argparse.ArgumentParser(description="Find duplicate sounds that survived re-encoding.")
    ap.add_argument("root", help="directory to scan")
    ap.add_argument("-o", "--out", default="duplicates.tsv")
    ap.add_argument("--markdown", help="write a markdown report here")
    ap.add_argument("--cache", default="fingerprints.npz", help="'' to disable")
    ap.add_argument("--thr", type=float, default=0.97,
                    help="cosine threshold (default 0.97; below ~0.95 starts "
                         "matching alternate takes rather than duplicates)")
    ap.add_argument("--dur-tol", type=float, default=1.03,
                    help="max duration ratio between duplicates (default 1.03)")
    ap.add_argument("-j", "--jobs", type=int, default=os.cpu_count())
    ap.add_argument("--json", help="also write raw clusters as JSON")
    ap.add_argument("--only", help="file listing paths; report only clusters touching them")
    ap.add_argument("--fail-on", default="",
                    help="comma-separated categories that should exit 1")
    a = ap.parse_args()

    data, failed = build_cache(a.root, a.cache or None, a.jobs)
    clusters = cluster(data, a.thr, a.dur_tol)

    only_n = None
    if a.only:
        with open(a.only) as f:
            want = {os.path.normpath(l.strip()) for l in f if l.strip()}
        only_n = len(want)
        clusters = [c for c in clusters
                    if want & {os.path.normpath(x) for x in [c["keep"]] + c["dupes"]}]

    if a.json:
        with open(a.json, "w") as f:
            json.dump(clusters, f, indent=1)
    write_tsv(clusters, a.out, a.root)
    if a.markdown:
        sys.stdout.write(write_markdown(clusters, a.markdown, a.root, failed, only_n))

    total = sum(c["n"] - 1 for c in clusters)
    print(f"\n{len(clusters)} clusters, {total} redundant files", file=sys.stderr)

    bad = {c.strip() for c in a.fail_on.split(",") if c.strip()}
    if bad and any(categorise(c) in bad for c in clusters):
        sys.exit(1)


if __name__ == "__main__":
    main()
