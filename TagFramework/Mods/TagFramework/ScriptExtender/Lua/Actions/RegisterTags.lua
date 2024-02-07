local function AddToTagGroupsSubTable(fieldString, tagNameId, tagData)
  for _, tag in pairs(tagData[fieldString]) do
    CLUtils.AddToTable(Globals.TagGroups[tagNameId][fieldString], tag)
  end
end

function Actions.RegisterTags(tagNameId, tagData)
  if not Globals.TagGroups[tagNameId] then
    Globals.TagGroups[tagNameId] = {
      ReallyTag = tagData.ReallyTag,
      TagsToExclude = {},
      RaceMetaTags = {}
    }
  end

  Globals.TagGroups[tagNameId].ReallyTag = tagData.ReallyTag

  AddToTagGroupsSubTable("TagsToExclude", tagNameId, tagData)
  AddToTagGroupsSubTable("RaceMetaTags", tagNameId, tagData)
end
