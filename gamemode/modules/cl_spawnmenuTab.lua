spawnmenu.AddCreationTab( "BaseWars - Printers", function()

	local ctrl = vgui.Create( "SpawnmenuContentPanel" )
    
    local catlist = vgui.Create("DCategoryList", ctrl)
    catlist:Dock(FILL)

    local entities = catlist:Add("Entities")
    local iconlist_entities = vgui.Create("DIconLayout", entities)
    entities:SetContents(iconlist_entities)
    
    for k, v in pairs(BaseWars.Shop.Entities) do
        local ent = scripted_ents.Get(v)
        local icon = vgui.Create("SpawnIcon", iconlist_entities)
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

    local tier0 = catlist:Add("Printers - Tier 0")
    local iconlist = vgui.Create("DIconLayout", tier0)
    tier0:SetContents(iconlist)
    
    for k, v in pairs(BaseWars.Shop.PrinterT0) do
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

	return ctrl

end, "icon16/bricks.png", 2 )

spawnmenu.AddCreationTab( "BaseWars - Weapons", function()

	local ctrl = vgui.Create( "SpawnmenuContentPanel" )
    
    local catlist = vgui.Create("DCategoryList", ctrl)
    catlist:Dock(FILL)

    local tier0 = catlist:Add("Weapons")
    local iconlist = vgui.Create("DIconLayout", tier0)
    tier0:SetContents(iconlist)
    
    for k, v in pairs(BaseWars.Weapons.Shop) do
        print(weapons.Get(v["ClassName"]))
        local model = v["Model"]
        local icon = vgui.Create("SpawnIcon", iconlist)
        icon:SetModel(model)
        icon:SetToolTip(v["Name"] .. "\nPrice " .. BaseWars.Currency .. v["Price"] .. "\nLevel " .. v["Level"])
        icon.DoClick = function(icon)
            LocalPlayer():ConCommand("bw_buy_weapon " .. v["ClassName"])
        end
    end

	return ctrl

end, "icon16/bricks.png", 2 )

local hide = {
    [language.GetPhrase("spawnmenu.category.npcs")] = true,
    [language.GetPhrase("spawnmenu.category.entities")] = true,
    [language.GetPhrase("spawnmenu.category.weapons")] = true,
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