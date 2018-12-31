function FullRefundAll()
    for k, v in pairs(player.GetAll()) do
        local refund = 0
        for p, q in pairs(ents.FindByClass("bw_*")) do
            if q:GetNWEntity("owner", nil) == v then
                refund = refund + q.Price
                q:Remove()
            end
        end
        v:AddMoney(refund)
        sendHint("You got " .. BaseWars.Currency .. refund .. " refunded for all your entities!", false, false, v)
    end
end

function RefundAll()
    for k, v in pairs(player.GetAll()) do
        local refund = 0
        for p, q in pairs(ents.FindByClass("bw_*")) do
            if q:GetNWEntity("owner", nil) == v then
                refund = refund + (q.Price * 0.75)
                q:Remove()
            end
        end
        v:AddMoney(refund)
        sendHint("You got " .. BaseWars.Currency .. refund .. " refunded for all your entities!", false, false, v)
    end
end

function RefundPlayer(ply)
    local refund = 0
    for p, q in pairs(ents.FindByClass("bw_*")) do
        if q:GetNWEntity("owner", nil) == ply then
            refund = refund + (q.Price * 0.75)
            q:Remove()
        end
    end
    ply:AddMoney(refund)
    sendHint("You got " .. BaseWars.Currency .. refund .. " refunded for all your entities!", false, false, ply)
end

function FullRefundPlayer(ply)
    local refund = 0
    for p, q in pairs(ents.FindByClass("bw_*")) do
        if q:GetNWEntity("owner", nil) == ply then
            refund = refund + q.Price
            q:Remove()
        end
    end
    ply:AddMoney(refund)
    sendHint("You got " .. BaseWars.Currency .. refund .. " refunded for all your entities!", false, false, ply)
end