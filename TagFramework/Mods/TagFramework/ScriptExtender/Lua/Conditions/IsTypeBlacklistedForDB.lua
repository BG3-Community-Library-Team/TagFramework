function Conditions.IsTypeBlacklistedForDB(dbName, type)
  local found = false

  for _, typeVal in pairs(Globals.TypeBlacklist[dbName]) do
    if type == typeVal then
      found = true
    end
  end

  return found
end
