AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("modules.lua")

include("shared.lua")
include("config.lua")
include("modules.lua")

util.AddNetworkString("BaseWars_ChatMessage")
util.AddNetworkString("BaseWars_Hint")
util.AddNetworkString("BaseWars_chatMessage")
util.AddNetworkString("BaseWars_chatMessage_Server")

function findPlayer(name)
    for k, v in pairs(player.GetAll()) do
        if string.match(string.lower(v:Name()), string.lower(name)) or (string.lower(v:Name()) == string.lower(name)) then
            return v
        end
    end

    return nil
end
function GM:PlayerSwitchFlashlight( ply, enabled )
    return true
end