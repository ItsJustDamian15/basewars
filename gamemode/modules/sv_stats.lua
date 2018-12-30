function savePData(ply)
    ply:SetPData("bw_player_money", ply:GetNWInt("bw_player_money"))
    ply:SetPData("bw_player_level", ply:GetNWInt("bw_player_level"))
    ply:SetPData("bw_player_exp", ply:GetNWInt("bw_player_exp"))
    ply:SetPData("bw_player_karma", ply:GetNWInt("bw_player_karma"))
end

hook.Add("PlayerInitialSpawn", "stats_initialize", function(ply)
    if (ply:GetPData("bw_player_money") == nil) then
        ply:SetNWInt("bw_player_money", BaseWars.DefaultMoney)
    else
        ply:SetNWInt("bw_player_money", ply:GetPData("bw_player_money"))
    end
    if (ply:GetPData("bw_player_level") == nil) then
        ply:SetNWInt("bw_player_level", 1)
    else
        ply:SetNWInt("bw_player_level", ply:GetPData("bw_player_level"))
    end
    if (ply:GetPData("bw_player_exp") == nil) then
        ply:SetNWInt("bw_player_exp", 0)
    else
        ply:SetNWInt("bw_player_exp", ply:GetPData("bw_player_exp"))
    end
    if (ply:GetPData("bw_player_karma") == nil) then
        ply:SetNWInt("bw_player_karma", 0)
    else
        ply:SetNWInt("bw_player_karma", ply:GetPData("bw_player_karma"))
    end
end)

hook.Add("ShutDown", "stats_serverShutdown", function()
    for k, v in pairs(player.GetAll()) do
        savePData(v)
    end
end)

hook.Add("PlayerDisconnect", "stats_playerDisconnect", function(ply)
    savePData(v)
end)