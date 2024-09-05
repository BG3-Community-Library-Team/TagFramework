local function AddToTagGroupsSubTable(fieldString, tagNameId, tagData)
  if tagData[fieldString] then
    for _, tag in pairs(tagData[fieldString]) do
      CLUtils.AddToTable(Globals.TagGroups[tagNameId][fieldString], tag)
    end
  end
end

function Actions.RegisterTags(tagNameId, tagData)
  if not Globals.TagGroups[tagNameId] then
    -- TODO: Refactor to make things objects instead of seperate properties for Name and ID. Will be cleaner.
    Globals.TagGroups[tagNameId] = {
      Type = tagData.Type,
      Tag = tagData.Tag,
      TagName = tagData.TagName,
      TagId = tagData.TagId,
      ReallyTag = tagData.ReallyTag,
      ReallyTagName = tagData.ReallyTagName,
      ReallyTagId = tagData.ReallyTagId,
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
