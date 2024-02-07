Globals = {}
TF = {}
TF.UUID = "2cba831e-bc5e-4ed5-b831-b5c4580b02b0"
TF.modTableKey = "TagFramework"
TF.modPrTFix = "TF"
TF.modVersion = Ext.Mod.GetMod(TF.UUID).Info.ModVersion

Mods.TF = Mods.TagFramework
Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Utils"

CLGlobals, CLUtils = Mods.CommunityLibrary.Import(clImports)

Globals.TagGroups = {}

-- Used for TagsToExclude and RaceMetaTags
Globals.TagDict = {
  Baldurian = "BALDURIAN_f15e9b0d-676c-4f52-9abf-365cff89ef0f",
  Illithid = "ILLITHID_1eec74e8-3673-4500-abec-57b7ed8469ed",
  Underdark = "UNDERDARK_60f6b464-752f-4970-a855-f729565b5e07",
  Planar = "PLANAR_bad00ba2-8a49-450c-8387-af47681717f1",
  ReallyPlanar = "REALLY_PLANAR_4cb02915-7ad7-4141-907e-93253c6a8644",
  Rare = "RARE_d2f86ec3-c41f-47e1-8acd-984872a4d7d5",
  ReallyRare = "REALLY_RARE_987a41e3-2482-4c74-8c30-f3843cfdb7f3",
  Beastial = "BESTIAL_92aae5aa-4595-4f1c-96d2-9e2499d35c6f",
  ReallyBeastial = "REALLY_BESTIAL_1029b3e3-3ff0-4d73-b4ed-79b622cad4f9",
  Evil = "ALIGN_EVIL_6d08632e-0300-4587-80b9-8e411b0efb3b",
  Good = "ALIGN_GOOD_34064d50-38fe-44e4-aaed-129ac3b44933",
  Neutral = "ALIGN_NEUTRAL_c1ff8a7f-c430-4671-bc4e-098f874ae302"
}
