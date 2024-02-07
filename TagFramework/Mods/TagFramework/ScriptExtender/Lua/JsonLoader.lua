local configFilePathPattern = string.gsub("Mods/%s/ScriptExtender/TagFrameworkConfig.json", "'", "\'")

local function payloadTagTranslator(fromArr)
  if fromArr then
    local res = {}

    for _, tag in pairs(fromArr) do
      if not CLUtils.IsGuid(tag) then
        tag = Globals.TagDict[tag] or tag
        if tag then
          local fleshedTag = Ext.StaticData.Get(string.sub(tag, -36), "Tag")

          local tagName = fleshedTag.Name .. "_" .. fleshedTag.ResourceUUID
          CLUtils.AddToTable(res, tagName)
        end
      end
    end

    return res
  end
end

local function payloadDataInsert(tagData, payload, modGUID, count)
  local objName = tagData.Tag

  if count > 0 then
    objName = objName .. "_" .. count
  end

  if payload[objName] then
    payloadDataInsert(tagData, payload, modGUID, count + 1)
  else
    payload[objName] = {
      modGuids = tagData.modGuids or { modGUID },
      ReallyTag = tagData.ReallyTag,
      TagsToExclude = {},
      RaceMetaTags = tagData.RaceMetaTags or {}
    }
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
