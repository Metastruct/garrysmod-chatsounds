--- Chatsounds SVN Update Checker
--- for Google Code
--- by PotcFdk  -  2013/05/02

if SERVER then return end
if not chatsounds then return end

if chatsounds.did_update_check then return end -- only run once
chatsounds.did_update_check = true

local path = debug.getinfo(1, "S").short_src
if not isstring(path) then return end

chatsounds.addon_path = string.match(path, "^(addons/.-/)")

if not isstring(chatsounds.addon_path) or not file.Exists(chatsounds.addon_path..".svn/wc.db","GAME") then return end


-- we're here already, so why not
	chatsounds.is_svn = true
	chatsounds.IsSvn = true
	chatsounds.IsSVN = true

-- revision variables

chatsounds.live_rev = 0
chatsounds.revision = 0

function chatsounds.GetLocalRevision()
	return chatsounds.revision
end

function chatsounds.GetLiveRevision()
	return chatsounds.live_rev
end

-- Deal with spawnlag - variables

local done_local = false
local done_live = false

-- Check for new Revisions

function chatsounds.CheckLiveRevision()
	http.Fetch("http://code.google.com/feeds/p/chatsoundsforgmod/svnchanges/basic", function(content)
		local rev_str = string.match(content, "<title>Revision (%d*).*</title>")
		local auth_str = string.match(content, "<name>(.-)</name>")
		chatsounds.live_rev = tonumber(rev_str) or 0
		chatsounds.live_author = auth_str
		done_live = true
	end)
end

-- Find out local revision.
-- Helpful resource:
-- http://netpl.blogspot.de/2011/10/reading-revision-number-of-local-copy.html

function chatsounds.CheckLocalRevision()
	local File = file.Open(chatsounds.addon_path..".svn/wc.db","rb","GAME")
	local rev_str = File:Read(File:Size())
	File:Close()

	if isstring(rev_str) then
		for revx in string.gmatch(rev_str, "/!svn/ver/([0-9]*)/") do
			local foundrev = tonumber(revx) or 0
			if foundrev > chatsounds.revision then
				chatsounds.revision = foundrev
			end
		end
	end
	done_local = true
end

-- Black Magic

function chatsounds.NeedsUpdate()
	return chatsounds.live_rev > chatsounds.revision
end

-- Notify

function chatsounds.UpdateNotify()
	if chatsounds.NeedsUpdate() then
		local old_rev = tostring(chatsounds.GetLocalRevision())
		local new_rev = tostring(chatsounds.GetLiveRevision())
		local path = string.match(debug.getinfo(1, "S").short_src, "^(addons/.-/)")
			  path = string.sub(path, 1, -2)
		local red = Color(255,0,0)
		local white = Color(255,255,255)
		local blue = Color(120,120,255)
		local author_info = chatsounds.live_author and {white, " by ", blue, chatsounds.live_author} or {}
		chat.AddText(blue, "[", red, "CHATSOUNDS", blue, "] ", white,
			"There is a new version available!")
		chat.AddText(white, "Your Version: ", blue, old_rev, white,
			"  New Version: ", blue, new_rev, unpack(author_info))
		chat.AddText(white, "Please update your ", blue, path, white, " folder!")
	end
end

-- Auto-Check (deals with spawnlag / waits for checks to complete)

local triggered = 0

local function AutoCheck()
	if not done_local and triggered < 1 then
		chatsounds.CheckLocalRevision()
		triggered = 1
		return false
	elseif not done_live and triggered < 2 then
		chatsounds.CheckLiveRevision()
		triggered = 2
		return false
	elseif ( done_local and done_live ) and triggered >= 2 then
		chatsounds.UpdateNotify()
		triggered = 3
		return true
	else
		return false
	end
end

local timername = "chatsounds-updatecheck-spawn-wait"

timer.Create(timername, 10, 0, function()
	if AutoCheck() then
		timer.Destroy(timername)
	end
end)
