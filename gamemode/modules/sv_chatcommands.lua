hook.Add("PlayerSay", "bw_customChatCommands", function(ply, msg, team)
    local args = string.Split(msg, " ")

    if string.lower(args[1]) == "/sell" then
        ply:ConCommand("bw_sell_entity")
        return ""
    end

    if string.lower(args[1]) == "/upg" then
        ply:ConCommand("bw_upgrade_entity")
        return ""
    end

    if string.lower(args[1]) == "/pay" then
        ply:ConCommand("bw_givemoney " .. args[2] .. " " .. args[3])
        return ""
    end

    if string.lower(args[1]) == "!addmoney" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:AddMoney(amount)
        sendMessage(ply:Name() .. " Gave " .. target:Name() .. " " .. BaseWars.Currency .. amount .. "!", true, nil)
    end

    if string.lower(args[1]) == "!addlevel" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:AddLevel(amount)
        sendMessage(ply:Name() .. " Gave " .. target:Name() .. " " .. amount .. " level(s)!", true, nil)
    end

    if string.lower(args[1]) == "!addexp" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:AddExp(amount)
        sendMessage(ply:Name() .. " Gave " .. target:Name() .. " " .. amount .. " Exp!", true, nil)
    end

    if string.lower(args[1]) == "!setmoney" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:SetMoney(amount)
        sendMessage(ply:Name() .. " Set " .. target:Name() .. "'s money to " .. BaseWars.Currency .. amount .. "!", true, nil)
    end

    if string.lower(args[1]) == "!setlevel" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:SetLevel(amount)
        sendMessage(ply:Name() .. " Set " .. target:Name() .. "'s level to " .. amount .. "!", true, nil)
    end

    if string.lower(args[1]) == "!setexp" then
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        if args[3] == nil then sendHint("Invalid Arguments", true, false, ply) return end

        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        local target = findPlayer(args[2])
        local amount = tonumber(args[3])

        target:SetExp(amount)
        sendMessage(ply:Name() .. " Set " .. target:Name() .. "'s EXP to " .. amount .. "!", true, nil)
    end

    if string.lower(args[1]) == "!fullrefundall" then
        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        FullRefundAll()
    end

    if string.lower(args[1]) == "!refundall" then
        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        RefundAll()
    end

    if string.lower(args[1]) == "!refund" then
        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        local target = findPlayer(args[2])

        RefundPlayer(target)
    end

    if string.lower(args[1]) == "!fullrefund" then
        if not ply:isAdmin() then sendHint("You are not an admin!", true, false, ply) return end
        if args[2] == nil then sendHint("Invalid Arguments", true, false, ply) return end
        local target = findPlayer(args[2])

        FullRefundPlayer(target)
    end

    if string.lower(args[1]) == "/dw" then
        if table.HasValue(BaseWars.BlacklistedDrops, ply:GetActiveWeapon():GetClass()) then sendHint("You cant drop this!", true, false, ply) return end
        ply:DropWeapon(ply:GetActiveWeapon())
        return ""
    end
end)