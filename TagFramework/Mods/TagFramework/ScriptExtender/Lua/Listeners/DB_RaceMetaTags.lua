-- Apply Meta tags to race. (Ex. Planar, Underdark)
Ext.Osiris.RegisterListener("DB_RaceMetaTags", 2, "after", function (metaTag, baseTag)
  if baseTag == "AARAKOCRA_e8193d83-f2bc-4e21-8573-b4e158cc9363" then
    Actions.DBOperationLoop("DB_RaceMetaTags", "RaceMetaTags")
  end
end)
