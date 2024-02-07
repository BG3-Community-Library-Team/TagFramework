-- Assign Deity Cleric, Deity Paladin, and Deity Alignment tags to Deity
Ext.Osiris.RegisterListener("DB_GodClassAlignTags", 2, "after", function (deityTag, clericTag, paladinTag, alignmentTag)
  if deityTag == "BANE_494bddcf-9325-4883-a937-817fbdf11161" then
    for _, tagData in pairs(Globals.TagGroups) do
      if tagData.Type == "Deity" then
        Osi.DB_GodClassAlignTags(tagData.Tag, tagData.DeityCleric, tagData.DeityPaladin, tagData.DeityAlignment)
      end
    end
  end
end)
