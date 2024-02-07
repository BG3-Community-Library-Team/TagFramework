function Actions.DBOperationLoop(dbName, tagArrField)
  for _, tagData in pairs(Globals.TagGroups) do
    for _, linkedTag in pairs(tagData[tagArrField]) do
      if not Conditions.IsTypeBlacklistedForDB(dbName, tagData.Type) then
        local tagToApply = tagData.reallyTag or tagData.Tag
        Osi[dbName](linkedTag, tagToApply)
      end
    end
  end
end
