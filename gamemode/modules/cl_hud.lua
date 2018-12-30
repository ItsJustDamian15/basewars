hook.Add("HUDShouldDraw", "hideDefaults", function(name)
    if BaseWars.HUD.HideDefault[name] then return false end
end)

hook.Add("HUDPaint", "DrawCustomHud", function()
    local ply = LocalPlayer()

    draw.RoundedBox(5, 5, ScrH() - 105, 250, 100, Color(0, 0, 0, 220))
    draw.RoundedBox(0, 10, ScrH() - 100, 240, 15, Color(40, 40, 40, 220)) --Health
    draw.RoundedBox(0, 10, ScrH() - 80, 240, 15, Color(40, 40, 40, 220)) --Armor

    local health = ply:Health() or 0
    if health < 0 then health = 0 end
    if health > 100 then health = 100 end

    local armor = ply:Armor() or 0
    if armor < 0 then armor = 0 end
    if armor > 100 then armor = 100 end

    draw.RoundedBox(0, 10, ScrH() - 100, health * 2.4, 15, Color(20, 200, 20, 220))
    draw.RoundedBox(0, 10, ScrH() - 80, armor * 2.4, 15, Color(20, 20, 180, 220))

    draw.SimpleText("Health: " .. ply:Health() .. "%", "DermaDefault", 15, ScrH() - 100, Color(255,255,255,255))
    draw.SimpleText("Armor: " .. ply:Armor() .. "%", "DermaDefault", 15, ScrH() - 80, Color(255,255,255,255))

    draw.SimpleText(BaseWars.Currency .. ply:GetMoneyString(), "DermaDefault", 15, ScrH() - 60, Color(255,255,255,255))
    draw.SimpleText("Level: " .. ply:GetLevel(), "DermaDefault", 15, ScrH() - 45, Color(255,255,255,255))
    draw.SimpleText("Exp: " .. ply:GetExp() .. " / " .. (ply:GetLevel() * 500), "DermaDefault", 15, ScrH() - 30, Color(255,255,255,255))
end)