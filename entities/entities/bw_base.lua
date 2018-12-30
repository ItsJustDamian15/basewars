ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.Category = "BaseWars"
ENT.PrintName = "Base Entity"
ENT.Spawnable = true

ENT.Model = "models/props_c17/oildrum001.mdl"
ENT.Price = 0
ENT.ReqLevel = 1
ENT.Limit = 1
ENT.EntHealth = 100
ENT.time = 0

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Upgrade")
    self:NetworkVar("Int", 1, "Storage")
end

if SERVER then
    AddCSLuaFile()
    function ENT:Initialize()
        self:SetModel(self.Model)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)

        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
        end

        self.time = CurTime()
        self:SetUpgrade(1)

        self:SetHealth(self.EntHealth)
    end

    function ENT:OnTakeDamage(damage)
        self:SetHealth(self:Health() - damage:GetDamage())

        if self:Health() <= 0 then
            local attacker = damage:GetAttacker() or self:GetNWInt("owner")

            attacker:AddMoney(self.Price * 0.75)
            sendMessage("You received " .. BaseWars.Currency .. (self.Price * 0.75) .. " for destruction of " .. self.PrintName, attacker)
            self:Remove()
        end
    end

    function ENT:OnRemove()
        local owner = self:GetNWEntity("owner", nil)

        if owner != nil then
            owner:SetNWInt(self:GetClass().."count", owner:GetNWInt(self:GetClass().."count", 0) - 1)
        end
    end
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end