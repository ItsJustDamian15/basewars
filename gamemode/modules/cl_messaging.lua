net.Receive("BaseWars_ChatMessage", function()
    local message = net.ReadString()

    chat.AddText(Color(66, 188, 244), "[DG-BW] ", Color(237, 159, 42), message)
    surface.PlaySound( "buttons/button15.wav" )
end)

net.Receive("BaseWars_Hint", function()
    local message = net.ReadString()
    local isError = net.ReadBool()
    local notifyType = 0 --Generic

    if isError then notifyType = 1 end

    notification.AddLegacy(message, notifyType, 5)
    surface.PlaySound( "buttons/button15.wav" )
end)