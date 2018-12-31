function createFaction(creator, name, password, color)
    local tblcount = table.Count(team.GetAllTeams()) + 1

    team.SetUp(tblcount, name, color, true)
    creator:SetTeam(tblcount)
end