function GM:CanTool(ply, tr, tool)
    if not tr.Hit then return false end

    if tool == "remover" or tool == "material" or tool == "color" or tool == "paint" then
        if tr.Entity:GetNWInt("owner", nil) == ply then
            return true
        else
            return false
        end
    end

    print(tool)
    return true
end