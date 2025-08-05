local configFilePathPattern = string.gsub("Mods/%s/ScriptExtender/TagFrameworkConfig.json", "'", "\'")

local function translateSingleTag(tag)
  local res = tag or nil
  if tag and not CLUtils.IsGuid(string.sub(tag, -36)) then
    tag = Globals.TagDict[tag] or tag
    local fleshedTag = Ext.StaticData.Get(string.sub(tag, -36), "Tag")

    res = fleshedTag.Name .. "_" .. fleshedTag.ResourceUUID
  end

  return res
end

local function separateTagNameId(tag)
  if tag then
    if not CLUtils.IsGuid(tag:sub(-36)) then
      tag = Globals.TagDict[tag]
    end

    fleshedTag = CLUtils.CacheOrRetrieve(tag, "Tag")
  end

  return {
    Name = fleshedTag.Name,
    ID = fleshedTag.ResourceUUID
  }
end

local function payloadTagTranslator(fromArr)
  if fromArr then
    local res = {}

    for _, tag in pairs(fromArr) do
      local tagName = translateSingleTag(tag)
      CLUtils.AddToTable(res, tagName)
    end

    return res
  end
end

local function populateTagNamesAndIds(pl_object, tagData)
  if tagData.Tag then
    local tagNameAndId = separateTagNameId(tagData.Tag)
    pl_object.TagName = tagNameAndId[1]
    pl_object.TagId = tagNameAndId[2]
  end
  if tagData.ReallyTag then
    local reallyTagNameAndId = separateTagNameId(tagData.ReallyTag)
    pl_object.ReallyTag = translateSingleTag(tagData.ReallyTag)
    pl_object.ReallyTagName = reallyTagNameAndId[1]
    pl_object.ReallyTagId = reallyTagNameAndId[2]
  end

  return pl_object
end

local function payloadDataInsert(tagData, payload, modGUID, count)
  local objName = translateSingleTag(tagData.Tag)

  if count > 0 then
    objName = objName .. "_" .. count
  end

  if payload[objName] then
    payloadDataInsert(tagData, payload, modGUID, count + 1)
  else
    local tagNameAndId = separateTagNameId(tagData.Tag)
    local reallyTagNameAndId = separateTagNameId(tagData.ReallyTag)
    -- TODO: Refactor to make better use of separate tag name
    payload[objName] = {
      modGuids = tagData.modGuids or { modGUID },
      Type = tagData.Type,
      Tag = objName,
      DeityCleric = translateSingleTag(tagData.DeityCleric),
      DeityPaladin = translateSingleTag(tagData.DeityPaladin),
      DeityAlignment = translateSingleTag(tagData.DeityAlignment),
      TagsToExclude = {},
      RaceMetaTags = {},
      BG3SX_Support = tagData.BG3SX_Support
    }

    populateTagNamesAndIds(payload[objName], tagData)
    if tagData.TagsToExclude then
      payload[objName].TagsToExclude = payloadTagTranslator(tagData.TagsToExclude)
    end

    if tagData.RaceMetaTags then
      payload[objName].RaceMetaTags = payloadTagTranslator(tagData.RaceMetaTags)
    end

    return payload
  end
end

local function ConvertToPayload(data, modGUID)
  CLUtils.Info("Entering ConvertToPayload", Globals.InfoOverride)

  local payload = {}

  for _, tagData in pairs(data.Tags) do
    payload = payloadDataInsert(tagData, payload, modGUID, 0)
  end

  return payload
end

local function SubmitData(data, modGUID)
  CLUtils.Info("Entering SubmitData", Globals.InfoOverride)
  Api.RegisterTags(ConvertToPayload(data, modGUID))
end

---@param configStr string
---@param modGUID GUIDSTRING
local function TryLoadConfig(configStr, modGUID)
  CLUtils.Info("Entering TryLoadConfig", Globals.InfoOverride)
  local success, data = pcall(function ()
    return Ext.Json.Parse(configStr)
  end)
  if success then
    if data ~= nil then
      SubmitData(data, modGUID)
    end
  else
    CLUtils.Error(Strings.ERR_JSON_PARSE_FAIL .. CLUtils.RetrieveModHandleAndAuthor(modGUID))
  end
end

function LoadConfigFiles()
  CLUtils.Info("Entering LoadConfigFiles", Globals.InfoOverride)
  for _, uuid in pairs(Ext.Mod.GetLoadOrder()) do
    local modData = Ext.Mod.GetMod(uuid)
    local filePath = configFilePathPattern:format(modData.Info.Directory)
    local config = Ext.IO.LoadFile(filePath, "data")
    if config ~= nil and config ~= "" then
      CLUtils.Info("Found config for Mod: " .. Ext.Mod.GetMod(uuid).Info.Name, Globals.InfoOverride)
      local b, err = xpcall(TryLoadConfig, debug.traceback, config, uuid)
      if not b then
        CLUtils.Error(err)
      end
    end
  end
end
