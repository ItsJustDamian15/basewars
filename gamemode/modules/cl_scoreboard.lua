local ScoreboardDerma = nil

function GM:ScoreboardShow()
    if !IsValid(ScoreboardDerma) then
        ScoreboardDerma = vgui.Create("DFrame")
        ScoreboardDerma:SetSize(750, 500)
        ScoreboardDerma:Center()
        ScoreboardDerma:SetTitle("BaseWars - Scoreboard")
        ScoreboardDerma:SetDraggable(false)
        ScoreboardDerma:ShowCloseButton(false)
        ScoreboardDerma.Paint = function(s, w, h)
            draw.RoundedBox(5, 0, 0, w, h, Color(40, 40, 40))
        end

        local PlayerScrollPanel = vgui.Create("DScrollPanel", ScoreboardDerma)
        PlayerScrollPanel:SetSize(ScoreboardDerma:GetWide(), ScoreboardDerma:GetTall() - 20)
        PlayerScrollPanel:SetPos(0, 20)

        PlayerList = vgui.Create("DListLayout", PlayerScrollPanel)
        PlayerList:Dock(FILL)
        PlayerList:SetPos(0, 0)
    end

    if IsValid(ScoreboardDerma) then
        PlayerList:Clear()

        for k, v in pairs(player.GetAll()) do
            local PlayerPanel = vgui.Create("DPanel", PlayerList)
            PlayerPanel:SetSize(PlayerList:GetWide(), 50)
            PlayerPanel:SetPos(0, 0)
            PlayerPanel.Paint = function(s, w, h)
                draw.RoundedBox(0, 0, 0, w, h, Color(60, 60, 60))
                draw.RoundedBox(0, 0, 49, w, 1, Color(255, 255, 255))

                draw.SimpleText(v:Name() .. " - Level " .. v:GetLevel(), "DermaDefault", 20, 10, Color(255,255,255,255))
                draw.SimpleText(BaseWars.Currency .. v:GetMoneyString(), "DermaDefault", 20, 25, Color(255, 255, 255, 255))
                draw.SimpleText("Kills: " .. v:Frags() .. " - Deaths: " .. v:Deaths(), "DermaDefault", PlayerList:GetWide() - 20, 10, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
                draw.SimpleText("Faction: " .. team.GetName(v:Team()), "DermaDefault", PlayerList:GetWide() - 20, 25, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
            end
        end

        ScoreboardDerma:Show()
        ScoreboardDerma:MakePopup()
        ScoreboardDerma:SetKeyboardInputEnabled(false)
    end
end

function GM:ScoreboardHide()
    if IsValid(ScoreboardDerma) then
        ScoreboardDerma:Hide()
    end
end