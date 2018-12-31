ENT.Base = "base_ai"-- This entity is based on "base_ai"
ENT.Type = "ai"-- What type of entity is it, in this case, it's an AI.
ENT.AutomaticFrameAdvance = true-- This entity wilddl animate itself.
ENT.PrintName = "YEET NPC"
ENT.Spawnable = true
ENT.AdminOnly = false

if SERVER then
    AddCSLuaFile()
    util.AddNetworkString("basewars_helpNPC")

    function ENT:Initialize()
        self:SetModel( "models/player/p2_chell.mdl" )
        self:SetHullType( HULL_HUMAN )
        self:SetHullSizeNormal()
        self:SetNPCState( NPC_STATE_SCRIPT )
        self:SetSolid( SOLID_BBOX )
        self:CapabilitiesAdd( bit.bor( CAP_ANIMATEDFACE, CAP_TURN_HEAD ) )
        self:SetUseType( SIMPLE_USE )
        self:DropToFloor()
        
        self:SetMaxYawSpeed( 90 )	
    end

    function ENT:AcceptInput(name, act)
        if name == "Use" then
            net.Start("basewars_helpNPC")
            net.Send(act)
        end
    end
end

if CLIENT then
    net.Receive("basewars_helpNPC", function()
        local Frame = vgui.Create( "DFrame" )
        Frame:SetSize( 700, 400 )
        Frame:Center()
        Frame:SetTitle( "Helper NPC" )
        Frame:SetVisible( true )
        Frame:SetDraggable( false )
        Frame:ShowCloseButton( true )
        Frame:MakePopup()

        local list = vgui.Create("DListView", Frame)
        list:Dock(FILL)
        list:AddColumn("Basic Questions")
        list:AddLine("How do i buy printers?    Hold Q switch to 'BaseWars - Printers' tab and buy one!")
    end)
end