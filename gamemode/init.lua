AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("modules.lua")

include("shared.lua")
include("config.lua")
include("modules.lua")

util.AddNetworkString("BaseWars_ChatMessage")
util.AddNetworkString("BaseWars_Hint")

function findPlayer(name)
    for k, v in pairs(player.GetAll()) do
        if string.match(string.lower(v:Name()), string.lower(name)) or (string.lower(v:Name()) == string.lower(name)) then
            return v
        end
    end

    return nil
end