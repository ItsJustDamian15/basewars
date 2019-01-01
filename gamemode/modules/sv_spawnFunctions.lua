function GM:PlayerInitialSpawn(ply)
    sendMessage(ply:Name() .. " (" .. ply:SteamID() .. ") has connected to the server!", true)
    ply:SetTeam(0)
end

function GM:PlayerSpawn(ply)
    ply:SetModel("models/player/kleiner.mdl")
    ply:StripWeapons()
    for k, v in pairs(BaseWars.Loadout.Default) do
        ply:Give(v)
    end
    ply:SetupHands()

    ply:SetLevel(ply:GetLevel())
end

function GM:PlayerDeath(victim, inflictor, attacker)
    --attacker:AddFrags(1)
    for k, v in pairs(victim:GetWeapons()) do
        if not BaseWars.BlacklistedDrops[v] then
            victim:DropWeapon(v)
        end
    end
end

function GM:PlayerDeathSound()
    return true
end