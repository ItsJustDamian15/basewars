local server_modules = {
    "stats",
    "customizedProps",
    "concommands",
    "toolGunPatch",
    "playerMeta",
    "spawnFunctions",
    "physgunFix",
    "messaging",
    "chatcommands",
    "refunding"
}

local client_modules = {
    "hud",
    "spawnmenuTab",
    "messaging",
    "scoreboard"
}

local shared_modules = {
    "playerMeta",
    "blockNoClip"
}

if SERVER then
    for k, v in pairs(client_modules) do
        local file = "modules/cl_" .. v .. ".lua"
        AddCSLuaFile(file)
    end
    for k, v in pairs(shared_modules) do
        MsgC(Color(100, 255, 100), "[BW] Loading Shared Module " .. v .. "...\n")
        local file = "modules/sh_" .. v .. ".lua"
        AddCSLuaFile(file)
        include(file)
        MsgC(Color(100, 255, 100), "[BW] Loading Shared Module " .. v .. " done!\n")
    end

    for k, v in pairs(server_modules) do
        MsgC(Color(255, 100, 100), "[BW] Loading Module " .. v .. "...\n")
        local file = "modules/sv_" .. v .. ".lua"
        include(file)
        MsgC(Color(255, 100, 100), "[BW] Loading Module " .. v .. " done!\n")
    end
end

if CLIENT then
    for k, v in pairs(client_modules) do
        MsgC(Color(100, 100, 255), "[BW] Loading Module " .. v .. "...\n")
        local file = "modules/cl_" .. v .. ".lua"
        include(file)
        MsgC(Color(100, 100, 255), "[BW] Loading Module " .. v .. " done!\n")
    end
    for k, v in pairs(shared_modules) do
        MsgC(Color(100, 255, 100), "[BW] Loading Shared Module " .. v .. "...\n")
        local file = "modules/sh_" .. v .. ".lua"
        include(file)
        MsgC(Color(100, 255, 100), "[BW] Loading Shared Module " .. v .. " done!\n")
    end
end