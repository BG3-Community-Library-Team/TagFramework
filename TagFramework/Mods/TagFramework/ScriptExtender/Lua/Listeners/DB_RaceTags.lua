-- Apply the REALLY Tag
Ext.Osiris.RegisterListener("DB_RaceTags", 2, "before", function (raceTag, reallyTag)
  if raceTag == "HUMAN_69fd1443-7686-4ca9-9516-72ec0b9d94d7" then
    for _, tagData in pairs(Globals.TagGroups) do
      if tagData.Type == "Race" and tagData.ReallyTag then
        Osi.DB_RaceTags(tagData.Tag, tagData.ReallyTag)

        if tagData.BloodMerchantElixirId then
          Osi.DB_GLO_BloodElixirs_RacialElixirTemplates(tagData.ReallyTag, tagData.BloodMerchantElixirId, _)
        end
      end
    end
  end
end)
