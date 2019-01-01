function GM:CanTool(ply, tr, tool)
    if not tr.Hit then return false end

    if table.HasValue( BaseWars.BlacklistedTools, tool ) then
        sendHint("This tool has been blacklisted!", true, false, ply)
        return false
    end

    if tool == "remover" or tool == "material" or tool == "color" or tool == "paint" or tool == "fading_door" or tool == "nocollide" then
        if tr.Entity:GetNWInt("owner", nil) == ply then
            return true
        else
            return false
        end
    end
    
    return true
end