function Actions.AddToBG3SXList(tag, reallyTag, params)
  local bg3sxList = Mods.BG3SX.Data.ModdedTags[params.RaceModGuid]
  bg3sxList[tag.Name] = {
    TAG = tag.ID,
    Allowed = params.Allowed
  }

  if params.IncludeReally then
    bg3sxList[reallyTag.Name] = {
      TAG = reallyTag.ID,
      Allowed = params.Allowed,
      Reason = params.Reason or ""
    }
  end
end
