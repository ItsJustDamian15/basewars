local meta = FindMetaTable("Player")

function levelCheck(ply)
    local exp = ply:GetExp()
    local level = ply:GetLevel()

    if exp >= level * 500 then
        sendHint("You leveled up to " .. (level + 1), false, false, ply)
        ply:AddLevel(1)
        ply:AddExp(-level * 500)
    end
end

function meta:SetMoney(amount)
    self:SetNWInt("bw_player_money", amount)
end

function meta:AddMoney(amount)
    self:SetMoney(self:GetMoney() + amount)
end

function meta:SetLevel(amount)
    self:SetNWInt("bw_player_level", amount)
end

function meta:AddLevel(amount)
    self:SetLevel(self:GetLevel() + amount)
end

function meta:SetExp(amount)
    self:SetNWInt("bw_player_exp", amount)
    levelCheck(self)
end

function meta:AddExp(amount)
    self:SetExp(self:GetExp() + amount)
end