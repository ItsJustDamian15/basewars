ENT.Base = "bw_base"
ENT.PrintName = "Health Dispenser V1"
ENT.Model = "models/props_lab/reciever_cart.mdl"
ENT.Price = 100000
ENT.ReqLevel = 5
ENT.HealthPerUse = 10
ENT.MaxPlayerHealth = 100

if SERVER then
    AddCSLuaFile()

    function ENT:Use(act)
        act:SetMaxHealth(self.MaxPlayerHealth)
        act:SetHealth(act:Health() + self.HealthPerUse)

        if act:Health() > self.MaxPlayerHealth then
            act:SetHealth(self.MaxPlayerHealth)
        end
    end
end

if CLIENT then

end