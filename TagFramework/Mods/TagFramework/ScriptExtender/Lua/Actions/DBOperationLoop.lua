function Actions.DBOperationLoop(dbName, tagArrField)
  for tagName, tagData in pairs(Globals.TagGroups) do
    for _, linkedTag in pairs(tagData[tagArrField]) do
      Osi[dbName](linkedTag, tagName)
    end
  end
end
