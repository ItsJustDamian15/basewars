local meta = FindMetaTable("Player")

function meta:GetMoney()
    return tonumber(self:GetNWInt("bw_player_money"))
end

function meta:GetMoneyString()
    return string.Comma(self:GetMoney())
end

function meta:GetLevel()
    return tonumber(self:GetNWInt("bw_player_level"))
end

function meta:GetExp()
    return self:GetNWInt("bw_player_exp")
end

function meta:GetKarma()
    return self:GetNWInt("bw_player_karma")
end