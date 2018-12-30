function GM:PhysgunPickup(ply, ent)
    if ent:GetNWEntity("owner", nil) == ply then
        return true
    else
        return false
    end
end