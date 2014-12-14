if CLIENT then
	include("chatsounds/cl_core.lua")
	include("chatsounds/capsadmins_font_cache_thing.lua")
	include("chatsounds/autocomplete.lua")

	if file.Exists("lua/chatsounds/updatecheck.lua","GAME") then
		include("chatsounds/updatecheck.lua")
	end
end

if SERVER then
	AddCSLuaFile("autorun/chatsounds.lua")
	AddCSLuaFile("chatsounds/capsadmins_font_cache_thing.lua")
	AddCSLuaFile("chatsounds/autocomplete.lua")

	include("chatsounds/sv_core.lua")
end
