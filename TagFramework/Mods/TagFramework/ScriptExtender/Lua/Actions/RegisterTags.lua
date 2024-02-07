local function AddToTagGroupsSubTable(fieldString, tagNameId, tagData)
  for _, tag in pairs(tagData[fieldString]) do
    CLUtils.AddToTable(Globals.TagGroups[tagNameId][fieldString], tag)
  end
end

function Actions.RegisterTags(tagNameId, tagData)
  if not Globals.TagGroups[tagNameId] then
    Globals.TagGroups[tagNameId] = {
      Type = tagData.Type,
      Tag = tagData.Tag,
      ReallyTag = tagData.ReallyTag,
      TagsToExclude = {},
      RaceMetaTags = {},
      DeityClassAlignTags = {}
    }
  end

  Globals.TagGroups[tagNameId].ReallyTag = tagData.ReallyTag

  AddToTagGroupsSubTable("TagsToExclude", tagData.Tag, tagData)
  AddToTagGroupsSubTable("RaceMetaTags", tagData.Tag, tagData)
  AddToTagGroupsSubTable("DeityClassAlignTags", tagData.Tag, tagData)
end
