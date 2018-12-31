function bwBuyEntity(ply, cmd, args)
    if args[1] == nil then sendMessage("You need to enter a classname as argument!") return end
    local ent = ents.Create(args[1])
    local tr = ply:GetEyeTrace()

    if !(ent:IsValid()) then sendMessage("Entity is invalid!", false, ply) return end

    if(!tr.Hit) then sendMessage("Cant find a place to spawn it!", false, ply) return end
    local entCount = ply:GetNWInt(ent:GetClass() .. "count")
    if (entCount >= ent.Limit) then sendMessage("You reached the max of this entity!", false, ply) return end
    if ply:GetMoney() < ent.Price then sendMessage("You cannot afford this entity!", false, ply) return end
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

function bwUpgradeEntity(ply, cmd, args)
    local tr = ply:GetEyeTrace()
    if not tr.Hit then sendHint("You are not looking at an entity!", true, false, ply) return end
    local ent = tr.Entity

    if not ent.IsPrinter then sendHint("That entity is not a printer!", true, false, ply) return end
    local upgrade_price = ent.Price * ent:GetUpgrade()
    if not ply:CanAfford(upgrade_price) then sendHint("You cannot afford that upgrade!", true, false, ply) return end
    if ent:GetUpgrade() >= ent.MaxUpgrade then sendHint("That printer is already max level!", true, false, ply) return end
    ply:AddMoney(-upgrade_price)
    ent:SetUpgrade(ent:GetUpgrade() + 1)
    sendHint("Printer upgraded!", false, false, ply)
end
concommand.Add("bw_upgrade_entity", bwUpgradeEntity)

function bwSellEntity(ply, cmd, args)
    local tr = ply:GetEyeTrace()
    if not tr.Hit then sendHint("You are not looking at an entity!", true, false, ply) return end
    local ent = tr.Entity

    if ent:GetNWEntity("owner", nil) != ply then sendHint("That is not your printer!", true, false, ply) return end
    ply:AddMoney(ent.Price * 0.75)
    sendHint("Sold " .. ent.PrintName .. " for " .. BaseWars.Currency .. (ent.Price * 0.75) .."!", false, false, ply)
    ent:Remove()
end
concommand.Add("bw_sell_entity", bwSellEntity)

function bwBuyWeapon(ply, cmd, args)
    if args[1] == nil then sendMessage("Argument is empty!", false, ply) return end
    
    for k, v in pairs(BaseWars.Weapons.Shop) do
        if v["ClassName"] == args[1] then
            if not ply:CanAfford(v["Price"]) then sendHint("You cannot afford this weapon!", true, false, ply) return end
            if ply:GetLevel() < (v["Level"]) then sendHint("Your level is to low for this weapon!", true, false, ply) return end
            ply:AddMoney(-(v["Price"]))
            ply:Give(v["ClassName"])
            sendHint("You bought a " .. v["Name"] .. " for " .. BaseWars.Currency .. v["Price"], false, false, ply)
        end
    end
end
concommand.Add("bw_buy_weapon", bwBuyWeapon)

function bwGiveMoney(ply, cmd, args)
    if args[1] == nil then sendHint("Invalid arguments", true, false, ply) return end
    if args[2] == nil then sendHint("Invalid arguments", true, false, ply) return end
    local target = findPlayer(args[1])
    local amount = tonumber(args[2])

    if not ply:CanAfford(amount) then sendHint("You cannot afford to give this money!", true, false, ply) return end
    if amount > BaseWars.GiveLimit then sendHint("You tried to give more then the max!", true, false, ply) return end
    ply:AddMoney(-amount)
    target:AddMoney(amount)
    sendMessage("You gave " .. target:Name() .. " " .. BaseWars.Currency .. amount .. "!", false, ply)
    sendMessage("You got " .. BaseWars.Currency .. amount .. " from " .. ply:Name(), false, target)
end
concommand.Add("bw_givemoney", bwGiveMoney)

function bwDropMoney(ply, cmd, args)
    if args[1] == nil then sendHint("Invalid arguments", true, false, ply) return end
    local amount = tonumber(args[1])

    if not ply:CanAfford(amount) then sendHint("You cannot drop that mutch becouse you dont have that!", true, false, ply) return end
    ply:AddMoney(-amount)
    local ent = ents.Create("bw_money")
    ent:Activate()
    ent:Spawn()
    ent:SetAmount(amount)
end
concommand.Add("bw_dropmoney", bwDropMoney)