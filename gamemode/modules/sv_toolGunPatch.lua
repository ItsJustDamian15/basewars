--[[function TOOL:LeftClick(tr)
    if !tr.Hit then return false end
    local ent = tr.Entity
    if !ent:IsValid() then return false end

    local owner = ent:GetNWEntity("owner", nil)
    if owner != LocalPlayer() then return false end

    return true
end]]