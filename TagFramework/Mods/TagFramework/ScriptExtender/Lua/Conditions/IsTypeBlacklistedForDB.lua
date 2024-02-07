function Conditions.IsTypeBlacklistedForDB(dbName, type)
  local found = false

  if Globals.TypeBlacklist[dbName] then
    for _, typeVal in pairs(Globals.TypeBlacklist[dbName]) do
      if type == typeVal then
        found = true
      end
    end
  end

  return found
end
