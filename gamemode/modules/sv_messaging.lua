function sendMessage(message, isbroadcast, ply)
    net.Start("BaseWars_ChatMessage")
    net.WriteString(message)
    if isbroadcast then
        net.Broadcast()
    else
        net.Send(ply)
    end
end

function sendHint(message, isError, isBroadcast, ply)
    net.Start("BaseWars_Hint")
    net.WriteString(message)
    net.WriteBool(isError)
    if isBroadcast then
        net.Broadcast()
    else
        net.Send(ply)
    end
end