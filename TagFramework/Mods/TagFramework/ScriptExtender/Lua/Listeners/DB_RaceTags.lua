-- Give Dunmer the REALLY Dunmer Tag
Ext.Osiris.RegisterListener("DB_RaceTags", 2, "before", function (raceTag, reallyTag)
  if raceTag == "HUMAN_69fd1443-7686-4ca9-9516-72ec0b9d94d7" then
    for tagName, tagData in pairs(Globals.TagGroups) do
      Osi.DB_RaceTags(tagName, tagData.ReallyTag)
    end
  end
end)
