AddCSLuaFile("chatsounds/cl_core.lua")
--AddCSLuaFile("chatsounds/lists/default.lua")

local IncludeClientFile = IncludeClientFile or function(path)
	if SERVER then
		AddCSLuaFile(path)
	else
		include(path)
	end
end

util.AddNetworkString("chatsounds")

local files, folders = file.Find("chatsounds/lists_send/*", "LUA")
for _, game in pairs(folders) do
	for _, set in pairs(file.Find("chatsounds/lists_send/" .. game .. "/*.lua", "LUA")) do
		IncludeClientFile("chatsounds/lists_send/" .. game .. "/" .. set)
	end
end

local files, folders = file.Find("chatsounds/lists_nosend/*", "LUA")
for _, list in pairs(files) do
	AddCSLuaFile("chatsounds/lists_nosend/" .. list)
end


chatsounds = {}
local chatsounds = chatsounds
-- Initial Seed
chatsounds.Seed = os.time()

--bitshift
  local lshift, rshift
  local floor=math.floor
  function rshift(a,disp)
    if disp < 0 then return lshift(a,-disp) end
    return floor(a % 2^32 / 2^disp)
  end
  
  
  function lshift(a,disp)
    if disp < 0 then return rshift(a,-disp) end
    return (a * 2^disp) % 2^32
  end


function chatsounds.GenerateNewSeed()
	--[[
		Matt: More stable seed,
		last one was almost predictable without calculating
	]]
	chatsounds.Seed = (chatsounds.Seed * CurTime()) + 1
  chatsounds.Seed = (chatsounds.Seed + lshift(chatsounds.Seed , 3)) % 1024
	chatsounds.Seed = math.ceil(chatsounds.Seed)

	-- print(chatsounds.Seed)
end

local plys = {}
function chatsounds.GetRecipientFilter(pos)
	local i=1
	
	for key, ply in next,player.GetAll() do
		local enabled = ply:GetInfoNum("chatsounds_enabled",0)
		if enabled and enabled >= 1 then
			if not pos or (pos and ply:VisibleVec(pos)) then
				plys[i] = ply
				i = i + 1
			end
		end
	end
	
	while i<257 do
		if plys[i]==nil then break end
		plys[i]=nil
		i=i+1
	end

	return plys
end

local offground=Vector(0,0,16)
function chatsounds.Say(ply, text)
	if not IsValid(ply) then return end
	if text:Trim() == "" then return end
	
	if hook.Call("PreChatSoundsSay", nil, ply, text) == false then return end

	local seed = chatsounds.Seed - 127
	net.Start("chatsounds")
		net.WriteEntity(ply)
		-- cut to 32KB
		net.WriteString( text:sub(1,64000-32-32000) )
		net.WriteInt(seed,32)
		local pos = ply:GetPos()
		pos:Add(offground)
	net.Send(chatsounds.GetRecipientFilter(pos))
	
	chatsounds.GenerateNewSeed()
end

cvars.AddChangeCallback("chatsounds_enable_prefix", function(name, old, new)
	SetGlobalBool("chatsounds_enable_prefix", tobool(new))
end, "SetGlobalBool")
local chatsounds_enable_prefix = CreateConVar("chatsounds_enable_prefix", "0", bit.bor(FCVAR_ARCHIVE))

function chatsounds.PlayerSay(ply, text)
	if not chatsounds_enable_prefix:GetBool() then 
		chatsounds.Say(ply, text)
	return end
	if string.sub(text, 1, 2) == "##" then
		text = string.sub(text, 3)
		chatsounds.Say(ply, text)
		return text
	elseif string.sub(text, 1, 1) == "#" then
		text = string.sub(text, 2)
		chatsounds.Say(ply, text)
		return ""
	end
end
hook.Add("PlayerSay", "chatsounds_PlayerSay", chatsounds.PlayerSay)

function chatsounds.SaySound(ply, _, args,line)
	if not IsValid(ply) then return end
	
	if line:sub(1,1)=='"' and line:sub(-1,-1)=='"' then
		line = line:sub(2,-2)	
	end
	
	chatsounds.Say(ply, line)

	chatsounds.GenerateNewSeed()
end
concommand.Add("saysound", chatsounds.SaySound)


function chatsounds.ClearExistsCache()
	BroadcastLua("chatsounds.ClearExistsCache()")
end

function chatsounds.StopAllSounds()
	BroadcastLua("chatsounds.StopAllSounds()")
end
