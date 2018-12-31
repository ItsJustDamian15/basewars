ENT.Base = "bw_base"
ENT.PrintName = "Ammo Dispenser V1"
ENT.Model = "models/props_lab/reciever_cart.mdl"
ENT.Price = 100000
ENT.ReqLevel = 5
ENT.AmmoPerUse = 30

if SERVER then
    AddCSLuaFile()

    function ENT:Use(act)
        act:GiveAmmo(self.AmmoPerUse, act:GetActiveWeapon():GetPrimaryAmmoType(), false)
    end
end

if CLIENT then

end