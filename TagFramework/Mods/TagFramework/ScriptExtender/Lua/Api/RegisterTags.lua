function Api.RegisterTags(payload)
  CLUtils.Info("Entering Api.RegisterTags", Globals.InfoOverride)

  for tag, tagData in pairs(payload) do
    local found, missingMods = Conditions.IsAllModsLoaded(tagData.modGuids)

    if found then
      Actions.RegisterTags(tag, tagData)
    else
      CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ", "))
    end
  end
end
