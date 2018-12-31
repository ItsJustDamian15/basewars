function GM:CanTool(ply, tr, tool)
    if not tr.Hit then return false end

    if tr.Entity:GetNWInt("owner", nil) == ply then
        return true
    else
        return false
    end
end