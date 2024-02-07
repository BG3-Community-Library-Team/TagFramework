Ext.Osiris.RegisterListener("DB_GodClassAlignTags", 2, "after", function (deityTag, clericTag, paladinTag, alignmentTag)
  if deityTag == "BANE_494bddcf-9325-4883-a937-817fbdf11161" then
    for _, tagData in pairs(Globals.TagGroups) do
      Osi.DB_GodClassAlignTags(tagData.Tag, tagData.DeityCleric, tagData.DeityPaladin, tagData.DeityAlignment)
    end
  end
end)
