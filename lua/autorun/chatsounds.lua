if CLIENT then
	include("chatsounds/co.lua")
	include("chatsounds/cl_core.lua")
	include("chatsounds/capsadmins_font_cache_thing.lua")
	include("chatsounds/autocomplete.lua")
	include("chatsounds/updatecheck.lua")
end

if SERVER then
	AddCSLuaFile("autorun/chatsounds.lua")
	AddCSLuaFile("chatsounds/capsadmins_font_cache_thing.lua")
	AddCSLuaFile("chatsounds/autocomplete.lua")
	AddCSLuaFile("chatsounds/co.lua")
	AddCSLuaFile("chatsounds/updatecheck.lua")

	include("chatsounds/sv_core.lua")
end
