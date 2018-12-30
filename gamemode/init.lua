AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("modules.lua")

include("shared.lua")
include("config.lua")
include("modules.lua")

util.AddNetworkString("BaseWars_ChatMessage")
util.AddNetworkString("BaseWars_Hint")