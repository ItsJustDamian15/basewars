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
    ["weapon_physgun"] = true,
    ["weapon_fists"] = true,
    ["weapon_physcannon"] = true,
    ["gmod_tool"] = true
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
    {Name = "Pistol", ClassName = "weapon_pistol", Price = 5000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_pistol.mdl"},
    {Name = "SMG", ClassName = "weapon_smg1", Price = 7000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_smg1.mdl"},
    {Name = "Shotgun", ClassName = "weapon_shotgun", Price = 13000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_shotgun.mdl"},
    {Name = "Crossbow", ClassName = "weapon_crossbow", Price = 50000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_crossbow.mdl"},
    {Name = "RPG", ClassName = "weapon_rpg", Price = 1000000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_rocket_launcher.mdl"},
    {Name = "Frag Grende", ClassName = "weapon_frag", Price = 100000, Level = BaseWars.Weapons.LevelRequirement, Model = "models/weapons/w_grenade.mdl"}
}