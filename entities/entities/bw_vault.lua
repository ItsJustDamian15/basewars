ENT.Base = "bw_base"
ENT.PrintName = "Vault"

ENT.Model = "models/props_c17/FurnitureDrawer001a.mdl"
ENT.Price = 100000
ENT.ReqLevel = 10
ENT.Limit = 6
ENT.EntHealth = 150

if SERVER then
    AddCSLuaFile()
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()

        local pos = self:GetPos()
        local ang = self:GetAngles()

        ang:RotateAroundAxis(ang:Up(), 90)

        cam.Start3D2D(pos + (ang:Up() * 20), ang, 1)
            surface.SetFont("DermaDefault")
            draw.SimpleText("YEET", "DermaDefault", -surface.GetTextSize("YEET") * 0.5, -7.5, Color(255,255,255,255))
        cam.End3D2D()
    end
end