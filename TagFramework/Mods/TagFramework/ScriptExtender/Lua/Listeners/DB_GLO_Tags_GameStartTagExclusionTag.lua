Ext.Osiris.RegisterListener("DB_GLO_Tags_GameStartTagExclusionTag", 2, "after", function (exclusionTag, reallyRaceTag)
  if reallyRaceTag == "REALLY_DROWELF_676e854b-d74b-44f3-8363-3ef27164a54d" then
    Actions.DBOperationLoop("DB_GLO_Tags_GameStartTagExclusionTag", "TagsToExclude")
  end
end)
