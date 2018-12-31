ENT.Base = "bw_base"
ENT.PrintName = "Armor Dispenser V1"
ENT.Model = "models/props_lab/reciever_cart.mdl"
ENT.Price = 100000
ENT.ReqLevel = 5
ENT.ArmorPerUse = 10
ENT.MaxPlayerArmor = 100

if SERVER then
    AddCSLuaFile()

    function ENT:Use(act)
        act:SetArmor(act:Armor() + self.ArmorPerUse)

        if act:Armor() > self.MaxPlayerArmor then
            act:SetArmor(self.MaxPlayerArmor)
        end
    end
end

if CLIENT then

end