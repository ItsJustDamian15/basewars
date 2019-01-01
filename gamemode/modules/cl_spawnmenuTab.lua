function createIconListEntity(parrent, name, tbl)
    local cat = parrent:Add(name)
    local iconlist = vgui.Create("DIconLayout", cat)
    cat:SetContents(iconlist)
    
    for k, v in pairs(tbl) do
        local ent = scripted_ents.Get(v)
        local icon = vgui.Create("SpawnIcon", iconlist)
        icon:SetModel(ent.Model)
        icon:SetToolTip(ent.PrintName .. "\nPrice " .. BaseWars.Currency .. ent.Price .. "\nLevel " .. ent.ReqLevel)
        icon.DoClick = function(icon)
            LocalPlayer():ConCommand("bw_buy_entity " .. v)
        end

        local info = vgui.Create("DLabel", icon)
        info:SetText(ent.PrintName)
        info:SetColor(Color(0, 0, 0))
        info:SetPos(info.x, info.y + 50)
    end
end

function createIconListWeapon(parrent, name, tbl)
    local cat = parrent:Add("Weapons")
    local iconlist = vgui.Create("DIconLayout", cat)
    cat:SetContents(iconlist)
    
    for k, v in pairs(tbl) do
        print(weapons.Get(v["ClassName"]))
        local model = v["Model"]
        local icon = vgui.Create("SpawnIcon", iconlist)
        icon:SetModel(model)
        icon:SetToolTip(v["Name"] .. "\nPrice " .. BaseWars.Currency .. v["Price"] .. "\nLevel " .. v["Level"])
        icon.DoClick = function(icon)
            LocalPlayer():ConCommand("bw_buy_weapon " .. v["ClassName"])
        end

        local info = vgui.Create("DLabel", icon)
        info:SetText(v["Name"])
        info:SetColor(Color(0, 0, 0))
        info:SetPos(info.x, info.y + 50)
    end
end

spawnmenu.AddCreationTab( "BaseWars - Printers", function()

	local ctrl = vgui.Create( "SpawnmenuContentPanel" )
    
    local catlist = vgui.Create("DCategoryList", ctrl)
    catlist:Dock(FILL)

    createIconListEntity(catlist, "Base Entities", BaseWars.Shop.Entities)
    createIconListEntity(catlist, "Upgrades", BaseWars.Shop.Upgrades)
    createIconListEntity(catlist, "Printers - Tier 0", BaseWars.Shop.PrinterT0)
    createIconListEntity(catlist, "Printers - Tier 1", BaseWars.Shop.PrinterT1)

	return ctrl

end, "icon16/bricks.png", 2 )

spawnmenu.AddCreationTab( "BaseWars - Weapons", function()

	local ctrl = vgui.Create( "SpawnmenuContentPanel" )
    
    local catlist = vgui.Create("DCategoryList", ctrl)
    catlist:Dock(FILL)

    createIconListWeapon(catlist, "Weapons", BaseWars.Weapons.Shop)

	return ctrl

end, "icon16/bricks.png", 2 )

local hide = {
    [language.GetPhrase("spawnmenu.category.npcs")] = true,
    --[language.GetPhrase("spawnmenu.category.entities")] = true,
    --[language.GetPhrase("spawnmenu.category.weapons")] = true,
    [language.GetPhrase("spawnmenu.category.vehicles")] = true,
    [language.GetPhrase("spawnmenu.category.postprocess")] = true,
    [language.GetPhrase("spawnmenu.category.saves")] = true,
    [language.GetPhrase("spawnmenu.category.dupes")] = true,
}

local function removeOldTabls()
    for k, v in pairs( g_SpawnMenu.CreateMenu.Items ) do
        if hide[v.Tab:GetText()] then g_SpawnMenu.CreateMenu:CloseTab(v.Tab, true) removeOldTabls() end
    end
end

hook.Add( "PopulateContent", "bw_hideDefaults", function( pnlContent, tree, node )
	removeOldTabls()
end )