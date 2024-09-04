local function AddToTagGroupsSubTable(fieldString, tagNameId, tagData)
  if tagData[fieldString] then
    for _, tag in pairs(tagData[fieldString]) do
      CLUtils.AddToTable(Globals.TagGroups[tagNameId][fieldString], tag)
    end
  end
end

function Actions.RegisterTags(tagNameId, tagData)
  if not Globals.TagGroups[tagNameId] then
    Globals.TagGroups[tagNameId] = {
      Type = tagData.Type,
      Tag = tagData.Tag,
      ReallyTag = tagData.ReallyTag,
      BloodMerchantElixirId = tagData.BloodMerchantElixirId,
      DeityCleric = tagData.DeityCleric,
      DeityPaladin = tagData.DeityPaladin,
      DeityAlignment = tagData.DeityAlignment,
      TagsToExclude = {},
      RaceMetaTags = {},
      BG3SX_Support = tagData.BG3SX_Support
    }
  end

  Globals.TagGroups[tagNameId].ReallyTag = tagData.ReallyTag

  AddToTagGroupsSubTable("TagsToExclude", tagNameId, tagData)
  AddToTagGroupsSubTable("RaceMetaTags", tagNameId, tagData)

end
