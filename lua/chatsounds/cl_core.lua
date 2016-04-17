--setfenv(1,_G)
--[[
	have shortcuts in the list so you can do List["luigi fap"] = "woow2 it's hard aww aww"
	premade particles or effects of any sort should be possible to add in the List
	convert mp3's to wav and keep using wav, fuck mp3's and their silent spaces
	optimize the whole find thing, it's kind of laggy with long or repeated (hey*1000 (this might be something else)) sentences
	make ! a modifier somehow
	make it so sounds with more than one path will never play repeteadly (random like in the previous version)
	make a super cache or whatever function to store all sounds in autoadd to txt files that it will load instead along with length
	seed should be per player

	fix list sorting problems
]]


local IncludeClientFile = IncludeClientFile or function(path)
	if SERVER then
		AddCSLuaFile(path)
	else
		include(path)
	end
end

chatsounds = {} local c = chatsounds
local chatsounds = chatsounds


chatsounds.AutoAddPath = "chatsounds/autoadd/"
chatsounds.PitchRange = 5
chatsounds.BasePitch = 100
chatsounds.BaseVolume = 90
chatsounds.ExclamationMultiplier = 2
-- adobe audition adds 0.020 milliseconds on both ends, and all custom chatsounds were exported with adobe audition
chatsounds.SubMP3Duration = 0.010

chatsounds.PuncStart = "%f[%w%%](" -- Pattern for looking for words
chatsounds.PuncEnd = ")%f[%s%.%,%!%\"%'%?%~%*%-%=%+%(%)%:%;%#%&%^%@%%]"

chatsounds.ExistsCache = {}
chatsounds.KeyCache = {}
chatsounds.ScriptCache = {}

chatsounds.Enabled = CreateClientConVar("chatsounds_enabled", "1", true, true)
local chatsounds_volume = CreateClientConVar("chatsounds_volume", "0.9", true, false)
local function GetVolume()
	local f = chatsounds_volume:GetFloat() or 1
	f=f*100
	f=f>100 and 100 or f<0 and 0 or f
	return f
end
chatsounds.Initialized = false
chatsounds.AutoPrecacheAll = CreateClientConVar("chatsounds_autoprecache_all", 0, true, true)
chatsounds.AllowDSP = CreateClientConVar("chatsounds_dsp", 1, true, true):GetBool()

chatsounds.CSoundPatches = {}
chatsounds.Timers = {}
chatsounds.Seed = 0

chatsounds.default_lists = {
	"random",
	"default",
}


-- coroutines
local co = chatsounds_co

local chatsounds_threading = CreateClientConVar("chatsounds_threading","1",true,false)

local qq=0
local function yield(force,inco)
	if inco == false then return end
	
	qq=qq+1
	if qq>5000 or force then -- MAGIC CONSTANT!!!
		if inco==true or coroutine.running() then co.waittick() end
		qq=1
	end
end

local qq=0
local lastn
local function yieldx(inco,max,name)
	if inco == false then return end
	if lastn~=name then
		lastn=name
		for i=0,20 do
			co.waittick()
		end
		--Msg"\n"
		
	end
	--Msg(name)
	
	qq=qq+1
	if qq>max or force then
		if inco==true or coroutine.running() then co.waittick() end
		qq=1
	end
end

-- Debugging / Profiling
local chatsounds_dbgnull = CreateClientConVar("chatsounds_dbgnull", 0, false,false)
local chatsounds_debug = CreateClientConVar("chatsounds_debug", 0, false,false)


local Now = SysTime
local profiles = {}
local profiling= false
local function null()end

local function Profile(id)
	--if not chatsounds_debug:GetBool() then return end
	profiles[id]=Now()
end
local function ProfileEnd(id)
	--if not chatsounds_debug:GetBool() then return end
	local start = profiles[id] or (now+1)
	local now = Now()
	
	Msg("[CS] "..tostring(id)..' ')print(("took %4.1fms"):format( (now-start)*1000 ))
end
chatsounds.Profile    = null
chatsounds.ProfileEnd = null
concommand.Add("chatsounds_profile",function()
	profiling=not profiling
	chatsounds.Profile    = profiling and Profile or null
	chatsounds.ProfileEnd = profiling and ProfileEnd or null
	MsgN(profiling and "Profiling" or "Stopped profiling")
end)

------------------------------


function chatsounds.ListToString(set, exists, duration, _trans, comp)

	local tbl = type(set) == "table" and set or table.Copy(c.List[set])
	local q = '"'

	-- I'm trying to convert all duplicate refferences of another tab
	-- this does not work

--[[ 	for k,v in pairs(tbl) do
		for k2,v2 in pairs(tbl) do
			if k != k2 and v == v2 then
				tbl[k] = k2
			end
		end
	end ]]

	local temp = {}
	for key, value in pairs(tbl) do
		if exists then
			if type(value) == "table" then
				for i, sound in pairs(value) do
					if type(sound) == "table" then
						local path = (sound.snd or sound.path or sound[1])

						if not path then print(key) PrintTable(value) end
						if not file.Exists("sound/"..path, "GAME") then
							value[i] = nil
						end
					end
				end
			end
		end

		if type(value) ~= "table" or table.Count(value) == 0 then
			temp[key] = nil
		continue end

		table.insert(temp, {key = key, value = value})
	end

	table.sort(temp, comp or function(a,b) return #a.key > #b.key end)
	tbl = temp

	local str = "c.StartList("..q..tostring(set)..q..")\n"
		for i, value in pairs(tbl) do
			trigger = value.key:lower():gsub("%p", ""):gsub("%s+", " "):Trim()
			sounds = value.value

			if type(sounds) == "table" then
				str = str.."\tL["..q..trigger..q.."] = {\n"
					for key, sound in pairs(sounds) do
						if type(sound) == "table" then
							local path = (sound.snd or sound.path)

							if type(path) == "string" then
								str = str.."\t\t{\n\t\t\tpath = "..q..path:lower()..q
									if duration then
										duration, errord = c.GetSoundDuration(path)
										if not errord then
											str = str..",\n\t\t\tlength = " .. duration
										end
									end
								str = str..",\n\t\t},\n"
							end
						end
					end
				str = str.."\t}\n"
			elseif type(sounds) == "string" then
				str = str.."\tL["..q..trigger..q.."] = L["..q..sounds..q.."]\n\n"
			end

			if #tbl ~= i then
				str = str.."\n"
			end
		end
	str = str .. "c.EndList()"

	return str

	--[[
		c.StartList("mylist")
			L["fascinating"] = {
				{path = "vo/k_lab2/kl_slowteleport01.wav", length = 3.2425},
				{path = "vo/k_lab2/kl_slowteleport02.wav", length = 4.2345},
				{path = "vo/k_lab2/kl_slowteleport03.wav", length = 1.2425},
			}

			L["headhumpers"] = {
				{path = "vo/npc/barney/ba_headhumpers.wav", length = 2.2355},
			}

			L["yes, yes"] = {
				{path = "chatsounds/autoadd/misc/yes, yes.mp3", length = 5.234},
			}
		c.EndList()
	]]
end

function chatsounds.DumpListsToTXT()
	for set in pairs(c.List) do
		if set == "default" or set == "random" then continue end
		file.Write("chatsounds_dump/"..set..".txt", chatsounds.ListToString(set, true, true))
	end
end

function chatsounds.DumpListToTXT(set)
	file.Write("chatsounds_dump/"..set..".txt", chatsounds.ListToString(set, true, true))
end

concommand.Add("chatsounds_list_to_txt", function(_,_,args)
	if args[1] then
		c.DumpListToTXT(args[1])
	else
		c.DumpListsToTXT()
	end
end)

function chatsounds.InitializeLists(force)
	if not chatsounds.Enabled:GetBool() then
		
		-- do we want to drop caches here?
		--c.ExistsCache = {}
		--c.KeyCache = {}
		--c.ScriptCache = {}
		--c.List = {}
		
		return false
	end

	if c.Initialized and not force then
		return
	end
	
	if c.initializing then return false end
	
	
	
	if co.make(force) then return false end
	
	c.initializing = true
	
	--print"Starting list initialization..."

	c.ExistsCache = {}
	c.KeyCache = {}
	c.ScriptCache = {}

	local start = SysTime()

	c.List = {}
		local files,dir = file.Find("sound/" .. c.AutoAddPath .. "/*", "GAME")
		if not files then
			print("Chatsounds sounds not found")
			c.initializing = false
			return
		end
		
		for _, list in pairs(dir) do
			yieldx(inco,5,"1")
			if not file.Exists("chatsounds/lists_nosend/" .. list .. ".lua", "LUA") then
				if list:Left(2) == "__" then continue end
				c.StartList(list)
					list = list .. "/"
					local files,dirs = file.Find("sound/" .. c.AutoAddPath .. list .. "*", "GAME")
					for _, file_name1 in pairs(files) do
						if c.IsMP3(file_name1) or c.IsWAV(file_name1) or c.IsOGG(file_name1) then
							local key = file_name1:match("([^%.]+)%."):lower()
							L[key] = L[key] or {{path = c.AutoAddPath .. list .. file_name1}}
							if chatsounds.AutoPrecacheAll:GetBool() then util.PrecacheSound(c.AutoAddPath .. list .. file_name1) end
						end
					end
					for _,file_name1 in pairs(dirs) do
						L[file_name1] = L[file_name1] or {}
						local files, dir = file.Find("sound/" .. c.AutoAddPath .. list .. file_name1 .. "/*", "GAME")
						if not files then continue end
						for _, file_name2 in pairs(files) do
							if c.IsWAV(file_name2) or c.IsMP3(file_name2) or c.IsOGG(file_name2) then
								table.insert(L[file_name1], {path = c.AutoAddPath .. list .. file_name1 .. "/" .. file_name2})
								if chatsounds.AutoPrecacheAll:GetBool() then util.PrecacheSound(c.AutoAddPath .. list .. file_name1 .. "/" .. file_name2) end
							end
						end
						if #L[file_name1] == 0 then L[file_name1] = nil end
					end
				c.EndList()
			end
		end
		

	_G.c = chatsounds
		local files, folders = file.Find("chatsounds/lists_send/*", "LUA")
		for _, game in pairs(folders) do
			if not game:find("%.") then
					
				for _, set in pairs(file.Find("chatsounds/lists_send/" .. game .. "/*.lua", "LUA")) do
					IncludeClientFile("chatsounds/lists_send/" .. game .. "/" .. set)
					yieldx(inco,5,"2")
				end
			end
		end
		for _, set in pairs(file.Find("chatsounds/lists_nosend/*.lua", "LUA")) do
			include("chatsounds/lists_nosend/" .. set)
			yieldx(inco,10,"3")
		end

	_G.c = nil


	c.PrepareList()

	c.Initialized = true
	hook.Call("ChatsoundsUpdated", GAMEMODE)

	local blah = "InitializeLists took " .. math.Round(SysTime() - start, 3) .. " seconds"
	print(blah)
	--if easylua and easylua.PrintOnServer then easylua.PrintOnServer(blah) end
	c.initializing = false
end


function chatsounds.StartList(name, override)
	c.List[name] = not override and c.List[name] or {}
	L = c.List[name]
end

function chatsounds.EndList(name)
	L = nil
end

function chatsounds.PrepareList()
	local inco=coroutine.running()
	for set in pairs(c.List) do
		c.List[set] = table.LowerKeyNames(c.List[set])
	end

	c.SortedList = {}
	c.SortedListKeys = {}
	c.SetNames = {}
	c.SortedList2 = {}

	for set_name, set in pairs(c.List) do
		table.insert(c.SetNames, set_name)
		c.SortedList2[set_name] = c.SortedList2[set_name] or {}
		yieldx(inco,10,"4")
		for trigger, data in pairs(table.Copy(set)) do

			trigger = trigger:gsub("?", "")
			trigger = trigger:gsub("!", "")

			c.SortedListKeys[trigger] = c.SortedListKeys[trigger] or {key = trigger}
			c.SortedListKeys[trigger][set_name] = data

			c.SortedList2[set_name][trigger] = c.SortedList2[set_name][trigger] or {}
			c.SortedList2[set_name][trigger] = {key = trigger, value = data}
		end
	end

	for set in pairs(c.SortedList2) do
		c.SortedList2[set] = table.ClearKeys(c.SortedList2[set])
		yieldx(inco,15,"5")
		table.sort(c.SortedList2[set], function(a, b) return #a.key > #b.key end)
	end

	yieldx(inco,0,"6")
	local copied = table.Copy(c.SortedListKeys)
	yieldx(inco,0,"7")
	c.SortedList = table.ClearKeys(copied)
	yieldx(inco,0,"8")
	table.sort(c.SortedList, function(a, b) return #a.key > #b.key end)
	yieldx(inco,0,"9")
end

function chatsounds.AddSound(set, key, data)
	c.List[set][key] = data
	c.PrepareList(set)
end

chatsounds.Modifiers = {
	{
		modifier = "^",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetVolume(chtsnd:GetVar()/100)
		end,
	},
	{
		modifier = "~",
		type = "args",

		fetch = function(min, max)
			return {min = tonumber(min), max = tonumber(max)}
		end,

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			local var = chtsnd:GetVar()
			if not var or not var.min or not var.max then return end
			local min, max = var.min/100, var.max/100
			chtsnd:SetThinkFunction(function(chtsnd, frame)
				if frame > min and frame < max then
					chtsnd:GetCSoundPatch():ChangeVolume(0.0001, 0)
				else
					chtsnd:GetCSoundPatch():ChangeVolume(chtsnd:GetVolume(), 0)
				end
			end)
		end,
	},
	{
		modifier = "^^",
		type = "args",

		fetch = function(min, max)
			return {min = tonumber(min), max = tonumber(max)}
		end,

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			local var = chtsnd:GetVar()
			if not var or not var.min or not var.max then return end
			local min, max = var.min/100, var.max/100
			chtsnd:SetThinkFunction(function(chtsnd, frame)
				chtsnd:GetCSoundPatch():ChangeVolume(math.Clamp(Lerp((-frame+1), min, max), 0, 1), 0)
			end)
		end,
	},
	{
		modifier = "%",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetPitch(chtsnd:GetVar())
			chtsnd:SetDuration(chtsnd:GetRealDuration() / (chtsnd:GetPitch() / 255))
		end,
	},
	{
		modifier = "-",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetDuration(math.max(chtsnd:GetDuration() - chtsnd:GetModVar("-"), 0))
		end,
	},
	{
		modifier = "+",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetDuration(math.max(chtsnd:GetDuration() + chtsnd:GetModVar("+"), 0))
		end,
	},
	{
		modifier = "=",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetDuration(chtsnd:GetVar())
		end,
	},
	{
		modifier = "%?",
		type = "args",

		fetch = function(min, max)
			return {min = min, max = max}
		end,

		pre = function(chtsnd)			
			local var = chtsnd:GetVar()
			if not var or not var.min or not var.max then return end
			chtsnd:SetPitch(math.random(var.min, var.max))
		end,
	},
	{
		modifier = "*",
		type = "number",

		pre = function(chtsnd)

			for key, value in pairs(chtsnd:GetScript()) do
				if chtsnd:GetIndex() > key and value.mod then
					for key, value in pairs(value.mod) do
						if value.self.modifier == "*" then
						return end
					end
				end
			end


			if chtsnd:GetDuration() * chtsnd:GetVar() > 25 then return end

			local count = math.Clamp(chtsnd:GetVar()-1, 1, 50)

			for i = 1, count do
				local newchtsnd = table.Copy(chtsnd)
				newchtsnd:SetScript(chtsnd:GetScript())
				if newchtsnd.eyepitch then
					newchtsnd:SetPitch(newchtsnd.eyepitch)
				end
				chtsnd:GetScript()[chtsnd:GetIndex() + i] = newchtsnd
			end
		end,
	},
	{
		modifier = "%%",
		type = "args",

		fetch = function(min, max)
			return {min = tonumber(min), max = tonumber(max)}
		end,

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			local var =  chtsnd:GetVar()
			if not var or not var.min or not var.max then return end
			chtsnd:SetThinkFunction(function(chtsnd, frame)
				chtsnd:GetCSoundPatch():ChangePitch(math.Clamp(Lerp((-frame+1), var.min, var.max), 0, 255), 0)
			end)
		end,
	},
	{
		modifier = "??",
		type = "none",

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			chtsnd:SetThinkFunction(function(chtsnd, frame)
				if not chtsnd or not chtsnd:GetCSoundPatch() then return end
				local pl = chtsnd:GetPlayer()
				if not pl or not pl:IsValid() then return end
				
				chtsnd.eyepitch = math.Clamp((math.abs(pl:EyeAngles().p-89)/178)*255, 1, 255)
				chtsnd:GetCSoundPatch():ChangePitch(chtsnd.eyepitch, 0)
				
			end)
		end,
	},
	{
		modifier = "&",
		type = "number",

		post = function(chtsnd)
			if chtsnd:GetPlayer():GetPos():Distance(LocalPlayer():GetPos()) < 1500 and chatsounds.AllowDSP then
				LocalPlayer():SetDSP(chtsnd:GetVar())
				timer.Create("Chatsounds DSP Mod", chtsnd:GetDuration(), 1, function()
					LocalPlayer():SetDSP(0)
				end)
			end
		end,
	},
	{
		modifier = "#",
		type = "number",

		pre = function(chtsnd)
			local listsounds = c.SortedListKeys[chtsnd:GetKey()]

			if listsounds then
				local correct = {}

				for list,content in pairs(listsounds) do
					if type(content) ~= "table" then continue end

					local sounds = {}
					local functions = {}

					for k,v in pairs(content) do
					if type(v) == "function" then
						functions[k] = v
						continue
					end

					table.insert(sounds, v)
					end

					for k,v in pairs(sounds) do
					for i,j in pairs(functions) do
						v[i] = j
					end
					end

					table.Add(correct, sounds)
				end

				local snd = correct[math.Clamp(chtsnd:GetVar(), 1, #correct)]
				chtsnd:SetSoundPath(snd.path)
				chtsnd:SetDuration(c.GetSoundDuration(snd.path))
				chtsnd.pre = snd.pre
				chtsnd.post = snd.post
			end

			/*if sounds then
				sounds.key = nil
				sounds = table.ClearKeys(sounds)
				local path = sounds[math.Clamp(chtsnd:GetVar(), 1, #sounds)][1].path
				chtsnd:SetSoundPath(path)
				chtsnd:SetDuration(c.GetSoundDuration(path))
			end*/
		end,
	},
	{
		modifier = "##",
		type = "string",

		pre = function(chtsnd)
			local listsounds = c.SortedListKeys[chtsnd:GetKey()]

			if listsounds then
				local correct = {}

				for list,content in pairs(listsounds) do
					if list ~= chtsnd:GetVar() then continue end
					if type(content) ~= "table" then continue end

					local sounds = {}
					local functions = {}

					for k,v in pairs(content) do
						if type(v) == "function" then
							functions[k] = v
							continue
						end

						table.insert(sounds, v)
					end

					for k,v in pairs(sounds) do
						for i,j in pairs(functions) do
							v[i] = j
						end
					end

					table.Add(correct, sounds)
				end

				if #correct > 0 then
					local snd = (#correct > 1) and table.Random(correct) or correct[1]
					chtsnd:SetSoundPath(snd.path)
					chtsnd:SetDuration(c.GetSoundDuration(snd.path))
					chtsnd.pre = snd.pre
					chtsnd.post = snd.post
				end
			end
		end,
	},
	{
		modifier = "--",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			chtsnd:SetDuration(chtsnd:GetRealDuration() * (chtsnd:GetVar() / 100))
		end,

		post = function(chtsnd)
			timer.Simple(chtsnd:GetDuration(), function()
				chtsnd:RemoveCSoundPatch()
			end)
		end,
	},	
	{
		modifier = "++",
		type = "number",

		pre = function(chtsnd)
			chtsnd:SetMode(CHTSND_MODE_CSOUNDPATCH)
			chtsnd:SetDuration(chtsnd:GetRealDuration() * (-(chtsnd:GetVar() / 100) + 1))
		end,

		post = function(chtsnd)
			chtsnd:GetCSoundPatch():ChangeVolume(0, 0)
			
			timer.Simple(chtsnd:GetDuration(), function()
				chtsnd:GetCSoundPatch():ChangeVolume(1)
			end)
		end,
	},
}
c.SKIP = "%.%!%;"
local skip_tbl = {}
for key, value in pairs(c.Modifiers) do
	for char in value.modifier:gmatch(".") do
		skip_tbl[char] = true
	end
end

for char in pairs(skip_tbl) do
	c.SKIP = c.SKIP .. "%" .. char
end

table.sort(c.Modifiers, function(a, b)
	return #a.modifier > #b.modifier
end)

CHTSND_MODE_WORLDSOUND = 0
CHTSND_MODE_EMITSOUND = 1
CHTSND_MODE_CSOUNDPATCH = 2
CHTSND_MODE_BASS = 3

CHTSND_FETCH = 0
CHTSND_PRE = 1
CHTSND_POST = 2

local CHTSND = {pitch = 100, volume = 1}
CHTSND.__index = CHTSND

function chatsounds.NewChatSound(override)
	return setmetatable(table.Copy(override) or {
		ply = LocalPlayer(),
		mode = CHTSND_MODE_EMITSOUND,
		pitch = 100,
		path = "bitch.mp3"
	}, CHTSND)
end

function CHTSND:GetCSoundPatch() return self.csoundpatch end
function CHTSND:HasMod() return self.mod ~= nil end
function CHTSND:GetRealDuration() return self:GetListSound().length end
function CHTSND:GetListSound() return self.sound end
function CHTSND:RemoveCSoundPatch()
	local csound = self:GetCSoundPatch()
	if csound then
		if self.path and self.path:find("%.ogg") then
			csound:ChangeVolume(0, 0)
			csound:ChangePitch(0, 0)
			csound:SetSoundLevel(0)
		else
			csound:Stop()
		end
		self.csoundpatch = nil
	end
end
function CHTSND:GetModVar(mod)
	if self:HasMod() then
		for key, value in pairs(self.mod) do
			if value.self.modifier == mod then
				return value.fetch_var
			end
		end
	end
end

function CHTSND:CallModFunction(enum)
	if self:HasMod() then
		for key, value in pairs(self.mod) do
			if enum == CHTSND_FETCH and value.self.fetch then
				self.currentvar = value.fetch_var
					value.self.fetch(self)
				self.currentvar = nil
			elseif enum == CHTSND_PRE and value.self.pre then
				self.currentvar = value.fetch_var
					value.self.pre(self)
				self.currentvar = nil
			elseif enum == CHTSND_POST and value.self.post then
				self.currentvar = value.fetch_var
					value.self.post(self)
				self.currentvar = nil
			end
		end
	end
end

function CHTSND:IsValid()
	local valid_source = self:GetOrigin() ~= nil or IsValid(self:GetPlayer())
	local valid_csp = self:GetStatus() == CHTSND_POST and self:GetMode() == CHTSND_MODE_CSOUNDPATCH and self:GetCSoundPatch() and self:GetThinkFunction()

	if chatsounds.Debug and (not valid_source or not valid_csp) then
		PrintTable(self)

		print("valid source: ", valid_source)
		print("valid csp: ", valid_csp)
	end

	return valid_source or valid_csp
end

AccessorFunc(CHTSND, "Think", "ThinkFunction")
AccessorFunc(CHTSND, "duration", "Duration")
AccessorFunc(CHTSND, "mode", "Mode")
AccessorFunc(CHTSND, "pitch", "Pitch")
AccessorFunc(CHTSND, "distortion_level", "DistortionLevel")
AccessorFunc(CHTSND, "seed", "Seed")
AccessorFunc(CHTSND, "path", "SoundPath")
AccessorFunc(CHTSND, "ply", "Player")
AccessorFunc(CHTSND, "origin", "Origin")
AccessorFunc(CHTSND, "index", "Index")
AccessorFunc(CHTSND, "script", "Script")
AccessorFunc(CHTSND, "key", "Key")
AccessorFunc(CHTSND, "time", "Time")
AccessorFunc(CHTSND, "currentvar", "Var")
AccessorFunc(CHTSND, "status", "Status")
AccessorFunc(CHTSND, "volume", "Volume")

chatsounds.chtsnd_meta = CHTSND


function chatsounds.AddModifier(symbol, type, callbacks)
	callbacks.modifier = symbol
	callbacks.type = type

	table.insert(c.Modifiers, callbacks)
end

function chatsounds.GetSoundPrefix()
	return ")"
end

-- utils

function chatsounds.GetValueFromSorted(tbl, key)
	for _, value in pairs(tbl) do
		if key == value.key then
			return value.value
		end
	end
end

--[[ 		local last_set = c.LastSet
		local sounds = c.TableRandom(c.SortedListKeys[key:lower():Trim()], function(set, value)
			if table.HasValue(c.SetNames, set) then
				if last_set == set then
					return true
				end
				last_set = set
				return true
			end
		end)

		local sound = c.GetRandomSound(sounds)

		if sound then
			return sound
		end ]]

function chatsounds.GetSound(key, return_sounds)
	if key then
		for trigger, value in pairs(c.SortedListKeys) do
			if trigger == key then

				local sounds

				if c.LastSet then
					sounds = value[c.LastSet]
				end

				if not sounds then
					for _, _value in pairs(c.ShuffleIterate(c.SetNames)) do
						sounds = value[_value.value]
						if sounds then
							c.LastSet = _value.value
						break end
					end
				end

				if sounds then
					return return_sounds and sounds or c.GetRandomSound(sounds)
				end
			end
		end
	end
end

function chatsounds.CRCRandom(seed, min, max)
	max = max +1
	return util.CRC(seed or c.Seed)%(max-min) + min
end

function chatsounds.ShuffleIterate(tbl, func)
	local new = {}
	for key, value in pairs(table.Copy(tbl)) do
		table.insert(new, {key = key, value = value, random = c.CRCRandom(c.Seed .. key, 0, 100)})
	end

	table.sort(new, function(a, b) return a.random > b.random end)

	if func then
		for key, value in pairs(new) do
			local values = {func(value.key, value.value)}
			if #values ~= 0 and values[1] ~= "continue" then
				return unpack(values)
			end
		end
	else
		return new
	end
end

function chatsounds.TableRandom(tbl, compare)
	if type(tbl) == "table" then
		return c.ShuffleIterate(tbl, function(key, value)
			if type(value) == "table" and value.skip_random then return "continue" end

			if not compare or (type(compare) == "function" and compare(key, value)) or (type(compare) == "string" and type(value) == compare) then
				return value
			end
		end)
	end
end

function chatsounds.GetRandomSound(sounds)
	if not sounds then return print("chatsounds got not sounds") end
	return c.Seed and c.TableRandom(sounds, "table") or table.Random(sounds)
end

function chatsounds.GetRandomSoundFromLists()
	return c.TableRandom(c.TableRandom(c.TableRandom(c.List, "table"), "table"), function(key,value) return value.path and #value.path > 3 end)
end

function chatsounds.GeneratePitch(sound)
	return sound and sound.pitch or (c.BasePitch + c.CRCRandom(c.Seed, -c.PitchRange, c.PitchRange))
end

function chatsounds.IsMP3(path)
	return path:Right(4) == ".mp3"
end
function chatsounds.IsWAV(path)
	return path:Right(4) == ".wav"
end
function chatsounds.IsOGG(path)
	return path:Right(4) == ".ogg"
end

function chatsounds.GetSoundDuration(path)
	
	if chatsounds_dbgnull:GetBool() then
		return SoundDuration("misc/null.wav")
	end
	
	if GetSoundDuration and c.IsMP3(path) then
		return (GetSoundDuration("sound/"..path) or 1) - c.SubMP3Duration
	elseif false and BASS and c.IsOGG(path) then -- todo: MAKE ASYNC and use sound.PlayFile
		local len
		local chan, err = BASS.StreamFile("sound/" .. path, true)

		if IsValid(chan) then
			len = chan:GetLength()
		else
			ErrorNoHalt("Bass error(" .. err .. ") on " .. path)
		end

		return len or 1
	else
		local duration = SoundDuration(path)
		return duration ~= 0 and duration or 1
	end
end

function chatsounds.SoundExists(path)
	if c.ExistsCache[path] then return false end

	if not file.Exists("sound/" .. path, "GAME") then
		c.ExistsCache[path] = true
		return false
	end
	return true
end

function chatsounds.ClearExistsCache()
	c.ExistsCache = {}
end

function chatsounds.CallCustomListFunction(enum, chtsnd)
	local sound = c.GetSound(chtsnd:GetKey(), true)
	if sound then
		if enum == CHTSND_PRE and sound.pre then
			sound.pre(chtsnd)
		end

		if enum == CHTSND_POST and sound.post then
			sound.post(chtsnd)
		end
	end
end

function chatsounds.StopAllSounds()
	for id in pairs(c.Timers) do
		timer.Destroy("csp_" .. id)
		c.Timers[id] = nil
	end
	for key, csp in pairs(c.CSoundPatches) do
		csp:Stop()
	end
	LocalPlayer():SetDSP(0)
	RunConsoleCommand("stopsound")
	hook.Call("ChatsoundsStopAllSounds", GAMEMODE)
end




-- most of the pattern matching stuff in this function is made by declan



function chatsounds.GetScriptFromText(text)

	local inco = coroutine.running()
	
	chatsounds.Profile"GSFT"
	c.LastSet = nil
	if not text or #text == 0 then return end

	local original_text = text
	if c.ScriptCache[original_text] then return c.ScriptCache[original_text] end

	text = text:lower() .. " "

	local result = {}
	local fstart, fend, match = nil,nil,nil
	local last_set = c.LastSet
	local stop = false
	
		
	local function FindMod(text)
		local offset = 0
		local mod

		local foundMod = true
		local modend = fend
		local order = 1
		repeat
			foundMod = false
			for index, data in next, c.Modifiers do

				if not original_text:find(data.modifier, nil, true) then continue end -- this /may/ or /may not/ help with spikes
				
				
				local sub = text:sub(modend + 1, modend + #data.modifier)

				if sub:find(data.modifier, nil, true) then
					local var
					if data.type == "number" then
						local match = text:match("([0-9%.]+)", modend + 1)
						var = match and tonumber(match) or nil
						modend = modend + (match and #match or 0) + #data.modifier
						offset = offset + (match and #match or 0) + #data.modifier
					elseif data.type == "args" then
						local match = text:match("([0-9%.0-9%.]+)", modend + 1)
						var = match and tostring(match) or nil
						modend = modend + (match and #match or 0) + #data.modifier
						offset = offset + (match and #match or 0) + #data.modifier
					elseif data.type == "string" then
						local match = text:match("[A-Za-z]+", modend + 1)
						var = match or nil
						modend = modend + (match and #match or 0) + #data.modifier
						offset = offset + (match and #match or 0) + #data.modifier
					end

					if var then
						mod = mod or {}
						mod[order] = {
							fetch_var = data.type and data.fetch and (data.type == "args" and data.fetch(unpack(string.Explode(".", var))) or data.fetch(var)) or var,
							self = data,
						}
						order = order + 1
						foundMod = true
					elseif data.type == "none" then
						offset = offset + #data.modifier
						mod = mod or {}
						mod[order] = {
							fetch_var = "nil",
							self = data,
						}
						order = order + 1
						foundMod = false
					end
				break end
			end
		until not foundMod or modend > #text

		if mod then mod = table.ClearKeys(mod) end
		return mod, offset
	end

	local function FindKey(key, set)

		-- no need to search for words if none are left
		-- could probably be a lot better with a pattern but I suck (capsadmin) at patterns so fuck that

		if #text:gsub("[_%s]+", "") == 0 then stop = true return end

		local found = false
		repeat
			fstart, fend, match = text:find(c.PuncStart .. key:lower() .. c.PuncEnd)
			
						
			if fstart then
				local mod, offset = FindMod(text, fend, original_text)

				table.insert(result, {
					pos = fstart,
					key = key,
					mod = mod,
					--set = set,
				})

				found = true

				text = text:sub(1, fstart - 1) .. ("_"):rep(key:len() + offset) .. text:sub(fend + offset + 1)
				--print(key, text, ({text:gsub("[_%s]+", "")})[1])
			end
		until not fstart

		return found
	end
		
		
	yield(true,inco)
	
	
	repeat
		yield(true,inco)
		
		if stop then break end

		
		if last_set then
			for _, value in pairs(c.SortedList2[last_set]) do
				yield(false,inco)
				FindKey(value.key)
			end
		else
			for _, value in pairs(c.SortedList) do
				yield(false,inco)
				if FindKey(value.key) then
					last_set = value.set
				end
			end
		end
	until fstart == nil or fend > #text


	c.LastSet = last_set

		
		
	-- Sort the results table by position of the word.
	table.sort(result, function(a, b) return a.pos < b.pos end)
	
	
	--PrintTable(result)
	c.ScriptCache[original_text] = result
	
	chatsounds.ProfileEnd"GSFT"
	
	return c.ScriptCache[original_text]
end

function chatsounds.Say(ply, text, seed)
	
	if c.InitializeLists()==false then return end
	
	if co and chatsounds_threading:GetBool() and co.make  (ply, text, seed) then return end
	
	chatsounds.Profile"Say"
	if not c.Enabled:GetBool() then return end

	text = text:lower()
	text = text:gsub("[^%w%a%s" .. c.SKIP .. "]", ""):gsub("%s+", " ")

	c.Seed = seed

	for text in text:gmatch("[^;]+") do -- razortrainhorn;eek
		local script = c.GetScriptFromText(text)

		if script then

			local _,distortion = text:gsub("%!", "!")
			distortion = distortion ~= 0 and distortion * c.ExclamationMultiplier or 1

			local time = 0

			for index, data in pairs(script) do
				c.Seed = c.Seed .. index
				local sound = c.GetSound(data.key)

				if sound then
					local chtsnd = c.NewChatSound(sound)

					-- the round part is a fix for sounds that was added with a length being a whole number
					-- because I was too lazy to get the real length of them

					if type(sound.length) ~= "number" or math.Round(sound.length) == sound.length then
						sound.length = c.GetSoundDuration(chtsnd:GetSoundPath())
					end

					chtsnd:SetDuration(sound.length)

					chtsnd.sound = sound
					chtsnd.script = script
					chtsnd.key = data.key
					chtsnd.mod = data.mod

					chtsnd.line = text
					chtsnd:SetDuration(chtsnd:GetDuration() / (c.BasePitch / 100))
					chtsnd:SetPitch(c.GeneratePitch(sound, c.Seed .. index))
					chtsnd:SetPlayer(ply)
					chtsnd:SetDistortionLevel(distortion)
					chtsnd:SetMode(CHTSND_MODE_EMITSOUND)
					chtsnd:SetIndex(index)
					chtsnd:SetSeed(c.Seed)

					c.CallCustomListFunction(CHTSND_PRE, chtsnd)
					chtsnd:CallModFunction(CHTSND_PRE)

					time = (chtsnd:GetTime() or time) + chtsnd:GetDuration()

					local id = chtsnd:GetKey() .. time

					chtsnd.exists = c.SoundExists(chtsnd:GetSoundPath())
					chtsnd.status = CHTSND_POST

					timer.Create("csp_" .. id , time - chtsnd:GetDuration(), 1, function() c.PlaySound(chtsnd, id) end)--c.PlaySound, chtsnd, id)
					c.Timers[id] = true
				end

				if index > 500 then print("chatsounds tried to play over 500 sounds ", text, ply) break end
			end
		end
	end
	chatsounds.ProfileEnd"Say"
	
end

function chatsounds.PlaySound(chtsnd, id)

	if hook.Call("PreChatSound", GAMEMODE, chtsnd) == false then return end

	if chtsnd:GetPitch() <= 0 or not c.SoundExists(chtsnd:GetSoundPath()) or not chtsnd:IsValid() then return end

	local distortion = (chtsnd:GetDistortionLevel() or 1)
	local sound_level = math.Clamp(math.Clamp(GetVolume() + distortion, GetVolume(), 160)*chtsnd:GetVolume(), 1, 160)
	local pitch = math.Clamp(chtsnd:GetPitch(), 0, 255)
	local ply = chtsnd:GetPlayer()
	

	if chtsnd:GetMode() == CHTSND_MODE_WORLDSOUND then
		for i = 1, distortion do
			local path = c.GetSoundPrefix()..chtsnd:GetSoundPath()
			if chatsounds_dbgnull:GetBool() then
				path = "misc/null.wav"
			end
			sound.Play(path, chtsnd:GetOrigin() or ply:GetShootPos(), sound_level, pitch)
		end
	elseif chtsnd:GetMode() == CHTSND_MODE_CSOUNDPATCH then

		local csp = c.CSoundPatches[ply:UniqueID() .. chtsnd:GetSoundPath()]

		if csp then
			csp:Stop()
			c.CSoundPatches[ply:UniqueID() .. chtsnd:GetSoundPath()] = nil
		end

		local path = c.GetSoundPrefix()..chtsnd:GetSoundPath()
		if chatsounds_dbgnull:GetBool() then
			path = "misc/null.wav"
		end
		csp = CreateSound(ply, path)
		csp:SetSoundLevel(sound_level)
		csp:PlayEx(1, pitch)
		csp:ChangeVolume(chtsnd:GetVolume(), 0)

		chtsnd.csoundpatch = csp
		c.CSoundPatches[ply:UniqueID() .. chtsnd:GetSoundPath()] = csp

		if chtsnd:GetThinkFunction() then

			local unique = "chatsounds_csp_think " .. tostring(chtsnd)
			local endtime = RealTime() + chtsnd:GetDuration()

			hook.Add("Think", unique, function()
				if chtsnd:IsValid() and endtime and endtime > RealTime() then
					chtsnd:GetThinkFunction()(chtsnd, (endtime - RealTime()) / chtsnd:GetDuration())
				else
					hook.Remove("Think", unique)
					chtsnd:RemoveCSoundPatch()
				end
			end)
		end

	elseif chtsnd:GetMode() == CHTSND_MODE_EMITSOUND then
		
		local chatsounds_dbgnull = chatsounds_dbgnull:GetBool()
		
		for i = 1, distortion do
			
			local path = c.GetSoundPrefix()..chtsnd:GetSoundPath()
			if chatsounds_dbgnull then
				path = "misc/null.wav"
			end
			
			ply:EmitSound(path, sound_level, pitch)
		end
	end

	c.CallCustomListFunction(CHTSND_POST, chtsnd)
	chtsnd:CallModFunction(CHTSND_POST)
	chtsnd.status = CHTSND_POST

	if id then c.Timers[id] = nil end

	hook.Call("PostChatSound", GAMEMODE, chtsnd)
end

file.CreateDir("chatsounds")

function chatsounds.GenListCached(name,time,cb)
	local path = "chatsounds/"..name..'.txt'
	
	local t = file.Time(path,'DATA')
	if t and t>time then
		local t = util.JSONToTable(file.Read(path,'DATA'))
		if t then 
			return t
		end
	end
	
	local t = cb()
	
	if not t then return end
	
	file.Write(path,util.TableToJSON(t))
	
	return t
end

function chatsounds.LoadCachedList(dirname,name,time,cb)
	
	local t = chatsounds.GenListCached(dirname,time,cb)
	
	c.StartList(name)
	for k,v in next,t do
		L[k] = { v }
	end
	c.EndList()

end



function chatsounds.ReceiveNet(len)
	local ply = net.ReadEntity()
	if not IsValid(ply) or ply:GetPos():Distance(LocalPlayer():GetPos()) > 5000 then return end
	local text = net.ReadString()
	local seed = net.ReadInt(32)
	seed = ply:Nick() .. (seed + 127)
	
	c.Say(ply, text, seed)
end
net.Receive("chatsounds", chatsounds.ReceiveNet)

function chatsounds.ReceiveRandomUsermessage(data)
	if not c.Enabled:GetBool() then return end

	local ply = data:ReadEntity()
	if not IsValid(ply) then return end

	local seed = ply:Nick() .. (data:ReadChar() + 127)

	c.PlaySound(c.NewChatSound(c.GetRandomSoundFromLists(seed)))
end
usermessage.Hook("chatsounds_random", chatsounds.ReceiveRandomUsermessage)

local function FindValue(tbl, str)
	for k,v in pairs(tbl) do
		if v.path and v.path:find(str) then return true end
	end
end

function chatsounds.Find(_,_, args)
	if not args[1] then
		print("Usage: chatsounds_find <(string)pattern><(boolean)path search>\n\tPattern can be either a normal string or a regex pattern, escape char is %. Normal strings may need escaping.")
		return
	end
	-- for set in pairs(c.List) do
		-- print([["]] .. set .. [["]] ..  " = {")
		-- for key, data in pairs(c.List[set]) do
				-- if key:find(args[1]) or args[2] and FindValue(data, args[1]) then
					-- print([["]] .. key .. [["]] ..  " = {")
					-- for key, value in pairs(data) do
						-- if value.path then
							-- MsgN("\t[" .. key .. "] = " .. tostring(value.path))
						-- end

						-- if key == #data then
							-- print("}\n")
						-- end
					-- end
				-- end
		-- end
		-- print("}\n")
	-- end
end
concommand.Add("chatsounds_find", chatsounds.Find)

local function FindValue(tbl, str)
	for k,v in pairs(tbl) do
		if v.path and v.path:find(str, nil, true) then return true end
	end
end

function chatsounds.DumpTable(_,_,args)

	args[1] = args[1] or not GetSoundDuration and "wav"

	for set in pairs(c.List) do
		print([["]] .. set .. [["]] ..  " = {")
			for key, data in pairs(c.List[set]) do

				if type(data) ~= "table" then continue end

				if args[1] == "mp3" and FindValue(data, ".wav") then continue end
				if args[1] == "wav" and FindValue(data, ".mp3") then continue end
				print([["]] .. key .. [["]] ..  " = {")
				for key, value in pairs(data) do
					if type(value) ~= "table" then continue end

					if value.path then
						MsgN("\t[" .. key .. "] = " .. tostring(value.path))
					end

					if key == #data then
						print("}\n")
					end
				end
			end
		print("}\n")
	end
end
concommand.Add("chatsounds_dump", chatsounds.DumpTable)

function chatsounds.DumpSimple(_,_,args)
	for set in pairs(c.List) do
		MsgN("\t" .. set .. ":")
		for key in pairs(c.List[set]) do
			MsgN(key)
		end
	end
end
concommand.Add("chatsounds_dump_simple", chatsounds.DumpSimple)

hook.Add("ChatTextChanged", "LazyInitializeLists", function()
	chatsounds.InitializeLists()
	hook.Remove("ChatTextChanged", "LazyInitializeLists")
end)


local function Initialize(force)
	
	chatsounds.InitializeLists(force)
	--Msg"CS "print"Starting InitializeLists"
	
	local prev
	local startsyst
	local start=0
	local Tag="chatsounds"
	local finishing, finish = false, 0
	
	local function PostRenderVGUI()
		cam.Start2D()
		surface.SetFont"closecaption_normal"
		surface.SetTextColor(180,255,255,255)
		
		--surface.DrawText"hi"
		local txt="Loading Chatsounds"

		startsyst=startsyst or SysTime()


		local w=250
		local h=55
		local sw=ScrW()
		local sh=ScrH()
		local mat=Matrix()
		
		local ft = FrameTime()
		ft=ft==0 and 1/10 or ft>0.5 and 0.4 or ft
		start=start+ft
		local f=start
		f=f>1 and 1 or f<=0 and 0 or f
		
		if not finishing then
			mat:Translate( Vector( sw-w,math.floor(sh*0.3-h*0.5)*math.sqrt(math.sin(f*math.pi/2)), 0) )
		else
			finish=finish+ft
			f=1-finish
			f=f>1 and 1 or f<=0 and 0 or f
			mat:Translate( Vector( sw-w,math.floor(sh*0.3-h*0.5)+math.floor(sh*0.3-h*0.5)*math.sqrt(math.sin(math.pi/2+f*math.pi/2)), 0) )
		end
		
		cam.PushModelMatrix(mat)
		
		surface.SetTextColor(180,200,255,f*255)
		surface.SetDrawColor(20,20,25,f*200)
		surface.DrawRect(0,0,w,h)
		surface.SetFont"closecaption_normal"
		local tw,th=surface.GetTextSize(txt..'     ')
		local tx,ty=w*0.5-tw*0.5,h*0.5-th
		surface.SetTextPos(tx,ty)
		
		if not finishing then
			surface.DrawText(txt)
			surface.DrawText(('.'):rep(((start-1)*2)%4))
		else
			surface.DrawText("Loaded Chatsounds!")
		end
		
		surface.SetTextColor(220,222,220,f*255)
		
		
		local len=SysTime()-startsyst
		local frac=(len-math.floor(len))*1000
		len=math.floor(len)
		local mins=math.floor(len/60)
		local secs=len%60
		
		surface.SetFont"DermaDefault"
		local txt = string.format("Stage: %s/9 Time: %.2d:%.2d.%.3d",lastn,mins,secs,frac)
		local tw2,th2=surface.GetTextSize(txt)
		surface.SetTextPos(tx,ty+th)
		surface.DrawText(txt)
		
		cam.PopModelMatrix()
		cam.End2D()
		
		if not c.initializing and not finishing then finishing = true finish = 0 end
		if finishing and f == 0 then hook.Remove("DrawOverlay",Tag) return end
		
	end

	hook.Add("DrawOverlay",Tag, PostRenderVGUI)
		
	
end


concommand.Add("chatsounds_init_lists", function()
	--chatsounds.InitializeLists(true)
	Initialize(true)
end)

local me = LocalPlayer()
if me and me:IsValid() then
	Initialize()
else
	hook.Add("Initialize", "chatsounds_init_lists", function() Initialize() end)
end