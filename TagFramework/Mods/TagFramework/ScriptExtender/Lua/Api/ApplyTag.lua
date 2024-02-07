function Api.ApplyTag(characterId, tag)
  local tagToApply = tag

  if not CLUtils.IsGuid(string.sub(tag, -36)) then
    tag = Globals.TagDict[tag] or tag
    local fleshedTag = Ext.StaticData.Get(string.sub(tag, -36), "Tag")

    tagToApply = fleshedTag.Name .. "_" .. fleshedTag.ResourceUUID
  end

  Osi.SetTag(characterId, tagToApply)
end
