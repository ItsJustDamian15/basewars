ENT.Base = "bw_base"
ENT.PrintName = "Basic Printer"

ENT.Model = "models/props_lab/reciever01a.mdl"
ENT.Price = 2000
ENT.ReqLevel = 1
ENT.Limit = 3
ENT.EntHealth = 150
ENT.PrintRate = 3
ENT.MaxCapacity = 10000
ENT.MaxUpgrade = 25
ENT.FontColor = Color(60, 60, 60)
ENT.IsPrinter = true

if SERVER then
    AddCSLuaFile()

    function ENT:Use(act)
        if self:GetNWEntity("owner", nil) != act then sendHint("You are not the printer owner!", true, false, act) return end
        if self:GetStorage() <= 0 then sendHint("The printer is empty!", true, false, act) else

            local stor = self:GetStorage()
            self:SetStorage(0)
            act:AddMoney(stor)
            act:AddExp(math.Round(stor * 1.25))
            sendHint("You took " .. BaseWars.Currency .. stor .. "!", false, false, act)
        end
    end

    function ENT:Touch(ent)
        if ent:GetClass() == "bw_upgrade_capacity" then
            self:SetCapacity(self:GetCapacity() * 2)
            ent:Remove()
        end
    end

    function ENT:Think()
        if CurTime() > self.time + 1 then
            self.time = CurTime()
            local amount = (self:GetUpgrade() * self.PrintRate)
            self:SetStorage(self:GetStorage() + amount)
            
            if self:GetStorage() > self:GetCapacity() then
                self:SetStorage(self:GetCapacity())
            end
        end
    end
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()

        local pos = self:GetPos()
        local ang = self:GetAngles()

        ang:RotateAroundAxis(ang:Up(), 90)

        surface.SetFont("DermaDefault")
        local printername = self.PrintName
        local printernamewidth = surface.GetTextSize(printername)
        local upgradeText = "Level: " .. self:GetUpgrade() .. " / " .. self.MaxUpgrade .. " (Next upgrade Price " .. BaseWars.Currency .. (self.Price * self:GetUpgrade()) .. ")"
        local upgradeTextWidth = surface.GetTextSize(upgradeText)
        local moneyText = BaseWars.Currency .. string.Comma(self:GetStorage()) .. " / " .. BaseWars.Currency .. string.Comma(self.MaxCapacity)
        local moneyTextWidth = surface.GetTextSize(moneyText)

        local cash = self:GetStorage()
        if cash < 0 then cash = 0 end
        if cash > 10000 then cash = 10000 end

        cam.Start3D2D(pos + (ang:Up() * 3.1), ang, 0.1)
            draw.RoundedBox(0, -100, -70, 200, 130, Color(0, 0, 0, 200))
            draw.SimpleText(printername, "DermaDefault", -printernamewidth * 0.5, -70, Color(255,255,255,255))
            draw.SimpleText(upgradeText, "DermaDefault", -upgradeTextWidth * 0.5, -60, Color(255,255,255,255))
            draw.SimpleText(moneyText, "DermaDefault", -moneyTextWidth * 0.5, 15, Color(255,255,255,255))
            draw.RoundedBox(0, -90, 30, 180, 25, Color(255, 255, 255, 255))
            draw.RoundedBox(0, -90, 30, cash * 0.018, 25, self.FontColor)
        cam.End3D2D()
    end
end