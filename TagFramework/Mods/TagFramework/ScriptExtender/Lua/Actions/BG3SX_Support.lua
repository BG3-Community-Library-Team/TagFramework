local function insertToBg3sxList(tag, params)
  local bg3sxList = Mods.BG3SX.Data.ModdedTags[params.RaceModGuid]
  bg3sxList[tag.Name] = {
    TAG = tag.ID,
    Allowed = params.Allowed,
    Reason = params.Reason or ""    
  }
end

function Actions.AddToBG3SXList(tag, reallyTag, params)
  insertToBg3sxList(tag, params)

  if params.IncludeReally then
    insertToBg3sxList(reallyTag, params)
  end
end
