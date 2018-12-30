function GM:PlayerSpawnedProp( ply, model, ent )
    ent:SetNWEntity("owner", ply)
    ent:SetHealth(100)
    for k, v in pairs(BaseWars.Props) do
        if model == k then 
            ent:SetHealth(v)
        end
    end
end

function GM:EntityTakeDamage(target, dmgInfo)
    if(target:GetClass() == "prop_physics") then
        target:SetHealth(target:Health() - dmgInfo:GetDamage())

        if target:Health() <= 0 then
            target:Remove()
        end
    end
end