function GM:PlayerNoClip(ply)
    if ply:isAdmin() then return true else return false end
end