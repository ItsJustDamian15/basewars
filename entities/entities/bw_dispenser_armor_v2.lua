ENT.Base = "bw_base_dispenser_armor"
ENT.PrintName = "Armor Dispenser V2"
ENT.Model = "models/props_lab/reciever_cart.mdl"
ENT.Price = 500000
ENT.ReqLevel = 10
ENT.ArmorPerUse = 25
ENT.MaxPlayerArmor = 150

if SERVER then
    AddCSLuaFile()
end