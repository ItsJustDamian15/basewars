ENT.Base = "bw_base"
ENT.PrintName = "Money Bag"

function ENT:SetupDataTables()
    self:NetworkVar("Int", 2, "Amount")
    self:NetworkVar("Int", 0, "Upgrade")
    self:NetworkVar("Int", 1, "Storage")
end

if SERVER then
    AddCSLuaFile()

    function ENT:Use(act)
        act:AddMoney(self:GetAmount())
        self:Remove()
    end
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end

    hook.Add("HUDPaint", "bw_MoneyInterface", function()
        local eye = LocalPlayer():GetEyeTrace()
        if not eye.Hit then return end

        if eye.Entity:GetClass() == "bw_money" then
            draw.SimpleText(self:GetAmount(), "DermaDefault", ScrW()/2, ScrH()/2, Color(60, 200, 60))
        end
    end)
end