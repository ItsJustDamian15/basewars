BaseWars = {}
BaseWars.HUD = {}
BaseWars.Loadout = {}
BaseWars.Shop = {}
BaseWars.Weapons = {}

BaseWars.HUD.HideDefault = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true
}

BaseWars.Loadout.Default = {
    "weapon_physgun",
    "weapon_fists",
    "weapon_physcannon",
    "gmod_tool"
}

BaseWars.BlacklistedDrops = {
    "weapon_physgun",
    "weapon_fists",
    "weapon_physcannon",
    "gmod_tool"
}

BaseWars.BlacklistedTools = {
    "hoverball",
    "emitter",
    "motor",
    "muscle",
    "pulley",
    "ballsocket",
    "axis",
    "hydraulic",
    "dynamite",
    "balloon",
    "physprop",
    "thruster",
    "wheel",
    "eyeposer",
    "faceposer",
    "finger",
    "inflator",
    "trails"
}

BaseWars.DefaultMoney = 10000
BaseWars.Currency = "€"
BaseWars.Weapons.LevelRequirement = 3
BaseWars.GiveLimit = 1000000000

BaseWars.Admins = {
    ["STEAM_0:0:0"] = true --Local PC
}

BaseWars.Donators = {
    ["STEAM_0:0:0"] = true --Local PC
}

BaseWars.Props = {
    ["models/props_building_details/Storefront_Template001a_Bars.mdl"] = 250,
    ["models/props_borealis/borealis_door001a.mdl"] = 250,
    ["models/props_c17/furnitureStove001a.mdl"] = 300,
    ["models/props_interiors/VendingMachineSoda01a.mdl"] = 50,
    ["models/props_lab/blastdoor001c.mdl"] = 225,
    ["models/props_lab/blastdoor001b.mdl"] = 225,
    ["models/props_lab/blastdoor001a.mdl"] = 225,
    ["models/props_phx/construct/metal_plate4x4.mdl"] = 275,
    ["models/props_phx/construct/metal_plate2x4.mdl"] = 275,
    ["models/props_phx/construct/metal_plate1x2.mdl"] = 275,
    ["models/props_phx/construct/metal_plate1.mdl"] = 275,
    ["models/props_phx/construct/glass/glass_plate4x4.mdl"] = 325,
    ["models/props_phx/construct/glass/glass_plate2x4.mdl"] = 325,
    ["models/props_phx/construct/glass/glass_plate2x2.mdl"] = 325,
    ["models/props_phx/construct/glass/glass_plate1x2.mdl"] = 325,
    ["models/props_phx/construct/glass/glass_plate1x1.mdl"] = 325,
    ["models/mechanics/solid_steel/plank_8.mdl"] = 500
}

BaseWars.Shop.Entities = {
    "bw_base_dispenser_ammo",
    "bw_base_dispenser_armor",
    "bw_base_dispenser_health",
    "bw_dispenser_armor_v2",
    "bw_dispenser_health_v2",
    "bw_dispenser_ammo_v2"
}

BaseWars.Shop.PrinterT0 = {
    --"bw_vault",
    "bw_base_printer",
    "bw_printer_0t1",
    "bw_printer_0t2",
    "bw_printer_0t3",
    "bw_printer_0t4",
    "bw_printer_0t5"
}

BaseWars.Shop.PrinterT1 = {
    "bw_printer_1t1",
    "bw_printer_1t2",
    "bw_printer_1t3",
    "bw_printer_1t4",
    "bw_printer_1t5"
}

BaseWars.Shop.Upgrades = {
    "bw_upgrade_capacity"
}

BaseWars.Weapons.Shop = {
    {Name = "Crowbar", ClassName = "weapon_crowbar", Price = 2000, Level = 1, Model = "models/weapons/w_crowbar.mdl"},
    {Name = "Colt 1911", ClassName = "m9k_coltscoped", Price = 5000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_pist_fiveseven.mdl"},
    {Name = "Bren Ten", ClassName = "m9k_bren_ten", Price = 5000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_pist_glock18.mdl"},
    {Name = "Remington", ClassName = "m9k_remington870", Price = 10000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_remington_870_tact.mdl"},
    {Name = "M3", ClassName = "m9k_m3", Price = 10000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_benelli_m3.mdl"},
    {Name = "Intervention", ClassName = "m9k_intervention", Price = 25000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_snip_int.mdl"},
    {Name = "Barret M98B", ClassName = "m9k_m98b", Price = 30000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_barrett_m98b.mdl"},
    {Name = "M24", ClassName = "m9k_m24", Price = 40000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_snip_m24_6.mdl"},
    {Name = "ACR", ClassName = "m9k_acr", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_masada_acr.mdl"},
    {Name = "AK 47", ClassName = "m9k_ak47", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_ak47_m9k.mdl"},
    {Name = "FN Fal", ClassName = "m9k_fal", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_fn_fal.mdl"},
    {Name = "G36", ClassName = "m9k_g36", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_hk_g36c.mdl"},
    {Name = "M4A1", ClassName = "m9k_m4a1", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_m4a1_iron.mdl"},
    {Name = "M60", ClassName = "m9k_m60", Price = 500000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_m60_machine_gun.mdl"},
    {Name = "Frag Grenade", ClassName = "m9k_m61_frag", Price = 500000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_grenade.mdl"},
    {Name = "Harpoon", ClassName = "m9k_harpoon", Price = 5000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_harpooner.mdl"},
    {Name = "Machete", ClassName = "m9k_machete", Price = 5000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_fc2_machete.mdl"}
    
}

if CLIENT then
    surface.CreateFont( "BaseWars_HUD", {
        font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
        size = 20,
        weight = 700,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false,
    } )
end