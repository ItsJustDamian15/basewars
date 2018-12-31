hook.Add("PlayerSay", "bw_customChatCommands", function(ply, msg, team)
    local args = string.Split(msg, " ")

    if string.lower(args[1]) == "/sell" then
        ply:ConCommand("bw_sell_entity")
        return ""
    end
end)