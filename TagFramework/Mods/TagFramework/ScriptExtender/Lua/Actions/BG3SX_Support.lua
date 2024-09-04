function Actions.AddToBG3SXList(tag, reallyTag, params)
  local bg3sxList = Mods.BG3SX.Data.ModdedTags[params.RaceModGuid]
  local tagName = tag:sub(1, #tag - 36)
  bg3sxList[tagName] = {
    TAG = tag:bar(-36),
    Allowed = params.Allowed
  }

  if params.IncludeReally then
    bg3sxList["REALLY_" .. tagName] = {
      TAG = reallyTag:bar(-36),
      Allowed = params.Allowed,
      Reason = params.Reason or ""
    }
  end
end
