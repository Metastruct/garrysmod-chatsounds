if SERVER then return end
if not chatsounds then return end

if chatsounds.did_update_check then return end -- only run once
chatsounds.did_update_check = true

chatsounds.has_repo = true

-- version variables

chatsounds.live_ver = 0
chatsounds.version  = 0

function chatsounds.GetLocalVersion()
	return chatsounds.version
end

function chatsounds.GetLiveVersion()
	return chatsounds.live_rev
end

local GIT_MASTER = ".git/refs/heads/master"
local gitpath
local function isGit()
	local path = string.match(debug.getinfo(1, "S").short_src, "^(addons/.-/)")
	if not isstring(path) then return false end
	
	gitpath = path..GIT_MASTER
	
	return file.Exists(gitpath, "GAME")
end


-- Deal with spawnlag - variables

local done_local = false
local done_live = false

function chatsounds.CheckLiveVersion()
	if isGit() then
		http.Fetch("https://api.github.com/repos/Metastruct/garrysmod-chatsounds/git/refs/heads/master", function(content)
			if isstring(content) then
				local foundrev = string.match(content, '"sha":%s-"(.-)"') or false
				if isstring(foundrev) then
					chatsounds.live_rev = foundrev
				end
			end
			done_live = true
		end)
		
		return
	end
	
	http.Fetch("https://raw.githubusercontent.com/Metastruct/garrysmod-chatsounds/master/lua/chatsounds/version.txt", function(content)
		if isstring(content) then
			local foundrev = tonumber(string.gmatch(content, "(%d+)")()) or 0
			if foundrev >= 1 then
				chatsounds.live_rev = foundrev
			end
		end
		done_live = true
	end)
end

function chatsounds.CheckLocalVersion()
	if isGit() then
		local rev_str = file.Read(gitpath, "GAME")

		if isstring(rev_str) then
			chatsounds.version = rev_str:Trim() -- it has a newline
		end
		done_local = true
		
		return
	end
	
	local rev_str = file.Read("chatsounds/version.txt", "LUA")

	if isstring(rev_str) then
		local foundrev = tonumber(string.gmatch(rev_str, "(%d+)")()) or 0
		if foundrev >= 1 then
			chatsounds.version = foundrev
		end
	end
	done_local = true
end

-- Black Magic

function chatsounds.NeedsUpdate()
	if isGit() then
		return chatsounds.live_rev ~= chatsounds.version
	end
	
	return chatsounds.live_rev > chatsounds.version
end

-- Notify

function chatsounds.UpdateNotify()
	if chatsounds.NeedsUpdate() then
		local old_rev = tostring(chatsounds.GetLocalVersion())
		local new_rev = tostring(chatsounds.GetLiveVersion())
		local path = string.match(debug.getinfo(1, "S").short_src, "^(addons/.-/)")
		
		local red = Color(255,0,0)
		local white = Color(255,255,255)
		local blue = Color(120,120,255)
		chat.AddText(blue, "[", red, "CHATSOUNDS", blue, "] ", white,
			"There is a new version available!")
		chat.AddText(white, "Your Version: ", blue, old_rev, white,
			"  New Version: ", blue, new_rev)
			
		if isstring(path) then
			chat.AddText(white, "Please update your ", blue, string.sub(path, 1, -2), white, " folder!")
		else
			chat.AddText(white, "Please update your garrysmod-chatsounds!")
		end
	end
end

-- Auto-Check (deals with spawnlag / waits for checks to complete)

local triggered = 0

local function AutoCheck()
	if not done_local and triggered < 1 then
		chatsounds.CheckLocalVersion()
		triggered = 1
		return false
	elseif not done_live and triggered < 2 then
		chatsounds.CheckLiveVersion()
		triggered = 2
		return false
	elseif (done_local and done_live) and triggered >= 2 then
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
