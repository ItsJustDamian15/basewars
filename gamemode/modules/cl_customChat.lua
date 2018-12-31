function GM:OnPlayerChat(ply, text, teamChat, isDead)

    local tab = {}

    if isDead then
        table.insert(tab, Color(255, 30, 40))
        table.insert(tab, "*DEAD* ")
    end

    if teamChat then
        table.insert(tab, Color(30, 160, 40))
        table.insert(tab, "(Team) ")
    end

    if ply:isDonator() then
        table.insert(tab, Color(8, 140, 28))
        table.insert(tab, "[$] ")
    end

    if ply:isAdmin() then
        table.insert(tab, Color(66, 182, 244))
        table.insert(tab, "[Management] ")
    end

    if IsValid(ply) then
        table.insert(tab, ply)
    else
        table.insert(tab, Color(0, 0, 0))
        table.insert(tab, "Console")
    end

    table.insert(tab, Color(255, 255, 255))
    table.insert(tab, ": " .. text)

    chat.AddText(unpack(tab))

    return true
end