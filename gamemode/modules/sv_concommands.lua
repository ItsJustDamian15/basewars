function bwBuyEntity(ply, cmd, args)
    if args[1] == nil then sendMessage("You need to enter a classname as argument!") return end
    local ent = ents.Create(args[1])
    local tr = ply:GetEyeTrace()

    if !(ent:IsValid()) then sendMessage("Entity is invalid!", false, ply) return end

    if(!tr.Hit) then sendMessage("Cant find a place to spawn it!", false, ply) return end
    local entCount = ply:GetNWInt(ent:GetClass() .. "count")
    if (entCount >= ent.Limit) then sendMessage("You reached the max of this entity!", false, ply) return end
    if ply:GetMoney() < ent.Price then sendMessage("You cannot afford this printer!", false, ply) return end
    if ply:GetLevel() < ent.ReqLevel then sendMessage("Your level is below the requirement!", false, ply) return end
    ply:AddMoney(-ent.Price)

    local SpawnPos = ply:GetShootPos() + ply:GetForward() * 80

    ent:SetNWEntity("owner", ply)

    ent:SetPos(SpawnPos)
    ent:Spawn()
    ent:Activate()

    ply:SetNWInt(ent:GetClass().."count", entCount + 1)

    sendHint("You bought a " .. ent.PrintName .. " for " .. BaseWars.Currency .. ent.Price, false, false, ply)

    return ent
end
concommand.Add("bw_buy_entity", bwBuyEntity)