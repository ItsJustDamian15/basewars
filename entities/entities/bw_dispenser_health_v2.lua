ENT.Base = "bw_base"
ENT.PrintName = "Health Dispenser V2"
ENT.Model = "models/props_lab/reciever_cart.mdl"
ENT.Price = 500000
ENT.ReqLevel = 10
ENT.HealthPerUse = 25
ENT.MaxPlayerHealth = 150

if SERVER then
    AddCSLuaFile()
end