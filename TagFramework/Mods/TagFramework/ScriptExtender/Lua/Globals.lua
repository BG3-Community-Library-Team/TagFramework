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
  Null = "NULL_00000000-0000-0000-0000-000000000000",
  Avatar = "AVATAR_306b9b05-1057-4770-aa17-01af21acd650",
  -- Forced Tags
  Baldurian = "BALDURIAN_f15e9b0d-676c-4f52-9abf-365cff89ef0f",
  Illithid = "ILLITHID_1eec74e8-3673-4500-abec-57b7ed8469ed",
  -- Race Metatags
  Underdark = "UNDERDARK_60f6b464-752f-4970-a855-f729565b5e07",
  ReallyUnderdark = "REALLY_UNDERDARK_2d0a73b9-f113-4d35-bdee-a31ab9163d74",
  Planar = "PLANAR_bad00ba2-8a49-450c-8387-af47681717f1",
  ReallyPlanar = "REALLY_PLANAR_4cb02915-7ad7-4141-907e-93253c6a8644",
  Rare = "RARE_d2f86ec3-c41f-47e1-8acd-984872a4d7d5",
  ReallyRare = "REALLY_RARE_987a41e3-2482-4c74-8c30-f3843cfdb7f3",
  Beastial = "BESTIAL_92aae5aa-4595-4f1c-96d2-9e2499d35c6f",
  ReallyBeastial = "REALLY_BESTIAL_1029b3e3-3ff0-4d73-b4ed-79b622cad4f9",
  -- Alignments
  Evil = "ALIGN_EVIL_6d08632e-0300-4587-80b9-8e411b0efb3b",
  Good = "ALIGN_GOOD_34064d50-38fe-44e4-aaed-129ac3b44933",
  Neutral = "ALIGN_NEUTRAL_c1ff8a7f-c430-4671-bc4e-098f874ae302",
  -- Deities and their Clerics/Paladins
  Bane = "BANE_494bddcf-9325-4883-a937-817fbdf11161",
  BaneCleric = "CLERIC_BANE_178016d5-e3d3-44bd-8aa5-6ac3d1c61e6c",
  BanePaladin = "PALADIN_BANE_2502057c-6210-4dcb-9943-2812b59c3737",
  Bhaal = "BHAAL_f5e62c47-fb93-449f-9057-cb1a3c003aff",
  BhaalCleric = "CLERIC_BHAAL_b03d4a89-bba7-45a4-a89d-a132ddd75637",
  BhaalPaladin = "PALADIN_BHAAL_5daae0e8-8f1a-4798-8247-c252dbc311da",
  Helm = "HELM_c33d2cf7-1c8d-41ea-b4d9-4773778410f6",
  HelmCleric = "CLERIC_HELM_6c28eba6-f46c-4755-9e4e-0223e64f7d72",
  HelmPaladin = "PALADIN_HELM_36c5df8b-7efc-4125-828e-120ed6cffa71",
  Ilmater = "ILMATER_75586076-1aaf-4e4a-a516-93f1e6cd3472",
  IlmaterCleric = "CLERIC_ILMATER_838e9a70-94fc-4bcf-850a-19be5247a43b",
  IlmaterPaladin = "PALADIN_ILMATER_bd987761-1952-4942-85f1-d4538042aff3",
  Kelemvor = "KELEMVOR_23541bea-8177-496d-b58b-c29c4f13c22c",
  KelemvorCleric = "CLERIC_KELEMVOR_a01efcc1-9e2f-4438-956b-b448cbf73bde",
  KelemvorPaladin = "PALADIN_KELEMVOR_74548677-271b-4cc3-9625-1782e5f0ebd1",
  Myrkul = "MYRKUL_f1fc9c3f-0db9-4d19-adb4-18b1174a6b9d",
  MyrkulCleric = "CLERIC_MYRKUL_7ea36792-21e5-4ea9-9544-de276651c376",
  MyrkulPaladin = "PALADIN_MYRKUL_6c080131-acd9-42e3-8bea-5de394672465",
  Mystra = "MYSTRA_e79d9eca-e8ac-486a-bd21-cf42ef1133af",
  MystraCleric = "CLERIC_MYSTRA_90de46bd-9f0c-4c2f-9505-56063b31b360",
  MystraPaladin = "PALADIN_MYSTRA_498946c4-246a-47dc-9c21-89fb538b2614",
  Oghma = "OGHMA_7b019d89-9b7e-4c2a-a6b4-ffb64f25f734",
  OghmaCleric = "CLERIC_OGHMA_9fbbedb6-c485-4c6b-94b7-c7d7592223b3",
  OghmaPaladin = "PALADIN_OGHMA_f639a9df-1adc-4897-b540-0a74b2bb5c2e",
  Selune = "SELUNE_4533d292-5b1f-43c7-ad44-6bc7db1000ca",
  SeluneCleric = "CLERIC_SELUNE_10b2a53c-3eb0-451c-8057-0f1cc9e62a4d",
  SelunePaladin = "PALADIN_SELUNE_f6dfdd47-bbf1-4419-b4b9-7a1e67a197da",
  Shar = "SHAR_486e4a27-e6f9-40a5-9dd1-108a1d0f60eb",
  SharCleric = "CLERIC_SHAR_0d1d64b8-70d6-4702-8643-be348b0f3fc6",
  SharPaladin = "PALADIN_SHAR_62f5382a-27c3-441c-bd57-33db4ca00f10",
  Tempus = "TEMPUS_f6b88f18-328f-41c3-a579-e8a9b99c410b",
  TempusCleric = "CLERIC_TEMPUS_31d96353-a4b8-4abf-9cce-f7a9174e65da",
  TempusPaladin = "PALADIN_TEMPUS_0b2bdab1-6455-4baa-883b-4f299376abb6",
  Tyr = "TYR_aa9a53ed-afad-4a6d-824c-ff0125986eb7",
  TyrCleric = "CLERIC_TYR_16657b43-323e-4eee-8982-77338229444b",
  TyrPaladin = "PALADIN_TYR_b8aec881-85fe-4e6e-8a28-7052ecd88899",
  Moradin = "MORADIN_cfad7ead-098a-4944-84a6-d0570a98984d",
  MoradinCleric = "CLERIC_MORADIN_3ce8734c-440c-43f8-b0f4-079d69e7eb33",
  MoradinPaladin = "PALADIN_MORADIN_395c6cef-953e-45c2-a342-e1326033c027",
  CorellonLarethian = "CORELLONLARETHIAN_575b3b3c-4a5b-44d5-868f-0c6875f95568",
  CorellonLarethianCleric = "CLERIC_CORELLONLARETHIAN_ca4e5850-139e-4b52-9d5e-553e33ff082a",
  CorellonLarethianPaladin = "PALADIN_CORELLONLARETHIAN_95abfcc0-8783-4647-a922-b2c34ec5c025",
  GarlGlittergold = "GARLGLITTERGOLD_4a4130a1-c96a-43e8-91cc-1e3959e50053",
  GarlGlittergoldCleric = "CLERIC_GARLGLITTERGOLD_67bd28cc-9cf4-4c64-9213-8d26fbe27e1b",
  GarlGlittergoldPaladin = "PALADIN_GARLGLITTERGOLD_9f6bb135-01f1-4b7d-80d3-50bab725728c",
  Yondalla = "YONDALLA_4335093d-2fa7-4775-a4cc-bc17b5d16e5a",
  YondallaCleric = "CLERIC_YONDALLA_dc005135-7eee-4406-a46e-9535e7412422",
  YondallaPaladin = "PALADIN_YONDALLA_c771a524-58fe-43e4-b8f0-b976e1b92d9f",
  Lolth = "LOLTH_899a6ce7-731e-473b-b87b-5d0cf383abff",
  LolthCleric = "CLERIC_LOLTH_7aee9e55-ecb4-4cdc-804d-1ec20d07efc5",
  LolthPaladin = "PALADIN_LOLTH_0cc54cdc-7b26-4b12-98af-f8000b37e988",
  Laduguer = "LADUGUER_92919073-a23b-490a-a316-a083f179f083",
  LaduguerCleric = "CLERIC_LADUGUER_4276e5a0-f6b3-4f4e-8836-4cd8b0cade2f",
  LaduguerPaladin = "PALADIN_LADUGUER_39cb63f2-3036-4641-9b43-777334c9ffab",
  Vlaakith = "VLAAKITH_d84b4081-6800-45f9-b03f-16dba592c75d",
  VlaakithCleric = "CLERIC_VLAAKITH_91b2d344-fce8-48b3-a83d-9688cbddb1b8",
  VlaakithPaladin = "PALADIN_VLAAKITH_e64a45b2-ba13-4097-a7f9-05f6c8bee312",
  Eilistraee = "EILISTRAEE_7cef166f-7766-4332-b9aa-d0d06fbca61e",
  EilistraeeCleric = "CLERIC_EILISTRAEE_c4749983-8bb9-4aa5-bf18-afd9cb1ce915",
  EilistraeePaladin = "PALADIN_EILISTRAEE_b438b4e8-fb16-4202-b338-17d2d874c2c1",
  Lathander = "LATHANDER_7cae2d74-89f3-4312-9816-6ae6827f318c",
  LathanderCleric = "CLERIC_LATHANDER_6e31b516-92fc-4526-b1cd-92516e02cf86",
  LathanderPaladin = "PALADIN_LATHANDER_cc528ff5-911c-467c-ac9f-7a1e94b97d25",
  Talos = "TALOS_c8650f16-4610-4648-95d1-18a44a1188b7",
  TalosCleric = "CLERIC_TALOS_da25a7cc-066d-43dc-8f1e-74c17cd0d589",
  TalosPaladin = "PALADIN_TALOS_5cc0a323-50e0-4775-92af-76a719f53147",
  Tymora = "TYMORA_c0b03fe2-6495-4340-a0c8-ed6ccf206bcc",
  TymoraCleric = "CLERIC_TYMORA_edc085f7-63f8-4bb0-b60c-b68c92b67708",
  TymoraPaladin = "PALADIN_TYMORA_aecc62c1-99ce-4ff7-952c-8ddc6afe7a30",
  Mielikki = "MIELIKKI_f21f419c-bbf8-42df-ae89-f1de72e90cf5",
  MielikkiCleric = "CLERIC_MIELIKKI_5ce73ec6-be80-4853-ad3c-12149d71e07e",
  MielikkiPaladin = "PALADIN_MIELIKKI_f18e3f3c-c227-4d11-8764-51c7fed44419",
  Bahamut = "BAHAMUT_fdccfc34-47e9-45ff-8755-511f91cb0e97",
  BahamutCleric = "CLERIC_BAHAMUT_28ee4ac1-86a3-490e-ab02-7085bd7c56d6",
  BahamutPaladin = "PALADIN_BAHAMUT_28b5d96a-bbfb-433f-9cd4-bdff98eae252",
  Gruumsh = "GRUUMSH_7ef33e10-bdb0-4268-833a-5da1e52aa26a",
  GruumshCleric = "CLERIC_GRUUMSH_c3743bdd-3653-47fb-8a5c-d8489d7a1be0",
  GruumshPaladin = "PALADIN_GRUUMSH_e33e9729-73e1-4fb3-aea9-761d610d1551",
  Tiamat = "TIAMAT_328683c2-8785-4b71-b128-7cec90df0abe",
  TiamatCleric = "CLERIC_TIAMAT_4cd1c7f7-7a8c-421a-87dc-687c4eefd683",
  TiamatPaladin = "PALADIN_TIAMAT_70be60f2-016d-40e5-b944-81b8868c3af9",
  -- Classes
  Barbarian = "BARBARIAN_02913f9a-f696-40cf-acdf-32032afab32c",
  Bard = "BARD_d93434bd-6b71-4789-b128-ee24156057cc",
  Cleric = "CLERIC_1671b4bf-4f47-4bb7-9cb9-80bb1f6009d5",
  Druid = "DRUID_44ac4317-4d38-4d28-80e2-94024c6e42f0",
  Fighter = "FIGHTER_1ae7017c-4884-4a43-bc4a-742fa0d201c0",
  Monk = "MONK_e1e460bb-d0ae-4452-8529-c9e176558731",
  Paladin = "PALADIN_6d85ab2d-5c23-498c-a61e-98f05a00177a",
  Ranger = "RANGER_37a733c1-a862-4157-b92a-9cff46232c6a",
  Rogue = "ROGUE_f8a0608b-666c-4be6-a49c-03b369c10bd2",
  Sorcerer = "SORCERER_18266c0b-efbc-4c80-8784-ada4a37218d7",
  Wizard = "WIZARD_6fe3ae27-dc6c-4fc9-9245-710c790c396c",
  Warlock = "WARLOCK_5804f55a-93f7-4281-9512-8d548a9e2a22",
  -- Backgrounds
  Charlatan = "CHARLATAN_07925e5b-af3d-4743-a565-b9fee04c24ac",
  Criminal = "CRIMINAL_74ed9de3-fff5-419a-949b-18bd5e17944e",
  Entertainer = "ENTERTAINER_bd3cfefd-5fe2-47ea-bd3c-e99eaad9b714",
  FolkHero = "FOLKHERO_9c38904c-4aed-4d22-9038-fc7d103aaed5",
  HauntedOne = "ce00b3b6-238e-4524-851b-3d1f2d2b1189",
  Hermit = "HERMIT_2fa3f042-2b50-41b2-8045-39ddd4421ca9",
  Noble = "NOBLE_56825486-9cfc-4ec2-87d1-c8065c41774b",
  Outlander = "OUTLANDER_d81df6f9-9f6e-4146-841a-9f285e6ee879",
  Sage = "SAGE_dad18490-c61d-4958-805c-f017eb68f8a0",
  Soldier = "SOLDIER_d135f265-c2e1-4077-a836-b548ee871681",
  Urchin = "URCHIN_2faee476-d77b-42a7-a4c6-2b9ac934673c",
  Acolyte = "ACOLYTE_906d1961-e9c6-4170-b775-62797a0efe1c",
  GuildArtisan = "GUILD_ARTISAN_baf9fb0e-f535-40a0-bb78-3ec289d84e66",
  Sailor = "SAILOR_3f4cfd9e-cc97-4fd9-ae7a-21f2948fd1b0",
  -- Race Tags
  Human = "HUMAN_69fd1443-7686-4ca9-9516-72ec0b9d94d7",
  ReallyHuman = "REALLY_HUMAN_8e288154-e7ca-4277-b2df-e61639b1cce8",
  Githyanki = "GITHYANKI_677ffa76-2562-4217-873e-2253d4720ba4",
  ReallyGithyanki = "REALLY_GITHYANKI_e49c027c-6ec6-4158-9afb-8b59236d10fd",
  Tiefling = "TIEFLING_aaef5d43-c6f3-434d-b11e-c763290dbe0c",
  ReallyTiefling = "REALLY_TIEFLING_7bf7207f-7406-49c0-b501-eaaa2bb4efd7",
  MephistophelesTiefling = "MEPHISTOPHELESTIEFLING_ec5bea6b-26f1-4917-919c-375f67ac13d1",
  ReallyMephistophelesTiefling = "REALLY_MEPHISTOPHELESTIEFLING_c70e1dc2-72d4-44f9-83fd-c63d247edd9b",
  AsmodeusTiefling = "ASMODEUSTIEFLING_c3fd1fc3-2edf-4d17-935d-44ab92406df1",
  ReallyAsmodeusTiefling = "REALLY_ASMODEUSTIEFLING_6591a20a-12de-46ff-bf82-b866cd97bb9a",
  ZarielTiefling = "ZARIELTIEFLING_ab677895-e08a-479f-a043-eac2d8447188",
  ReallyZarielTiefling = "REALLY_ZARIELTIEFLING_3a5efd84-5925-4a75-83ee-4f336b56f716",
  Elf = "ELF_351f4e42-1217-4c06-b47a-443dcf69b111",
  ReallyElf = "REALLY_ELF_772b1dc6-14be-417f-afa3-c6cf364f45b4",
  Drow = "DROWELF_a672ac1d-d088-451a-9537-3da4bf74466c",
  ReallyDrow = "REALLY_DROWELF_676e854b-d74b-44f3-8363-3ef27164a54d",
  SeldarineDrow = "SELDARINEDROWELF_6e913b6e-58b1-41bf-8751-89250dd17bff",
  ReallySeldarineDrow = "REALLY_SELDARINEDROWELF_d2d60a81-688e-4d3d-ba56-3e467cae37fc",
  LolthDrow = "LOLTHDROWELF_ef9c5b74-56a8-48cc-b0b9-169ee16bf026",
  ReallyLolthDrow = "REALLY_LOLTHDROWELF_c71eb8de-74e3-4d70-9826-22da7e2dc607",
  HighElf = "HIGHELF_492c3200-1226-4114-bad1-f6b1ba737f3d",
  ReallyHighElf = "REALLY_HIGHELF_78884c5f-9504-41af-912d-ce212df0ebea",
  WoodElf = "WOODELF_889e0db5-d03e-4b63-86d7-13418f69729f",
  ReallyWoodElf = "REALLY_WOODELF_b12e8dff-c1f0-4e9c-9ec0-1cafd22bb637",
  HalfElf = "HALFELF_34317158-8e6e-45a2-bd1e-6604d82fdda2",
  ReallyHalfElf = "REALLY_HALFELF_277f9609-ad0c-4883-b56d-0850904e88df",
  DrowHalfElf = "DROWHALFELF_4fa13243-199d-4c9a-b455-d844276a98f5",
  ReallyDrowHalfElf = "REALLY_DROWHALFELF_3dbe23e0-2c9f-4a81-b586-ec6e50f720e1",
  WoodHalfElf = "WOODHALFELF_5ffb703c-3ef4-493b-966d-749bc038f6bd",
  ReallyWoodHalfElf = "REALLY_WOODHALFELF_8ac1b27c-c5c4-4a2c-95dd-256e4349e483",
  HighHalfElf = "HIGHHALFELF_52b71dea-9d4e-402d-9700-fb9c360a44c9",
  ReallyHighHalfElf = "REALLY_HIGHHALFELF_bb7c731c-7af7-4c2d-b3d7-b4e8bd86a244",
  Halfling = "HALFLING_b99b6a5d-8445-44e4-ac58-81b2ee88aab1",
  ReallyHalfling = "REALLY_HALFLING_2b40a033-7a5c-47e9-92f0-7de9b5cd3a42",
  LightfootHalfling = "LIGHTFOOTHALFLING_57a00605-9e74-477c-bd9d-53c721e25e56",
  ReallyLightfootHalfling = "REALLY_LIGHTFOOTHALFLING_da1d4f47-8583-49a1-b262-d77d361b2e09",
  StoutHalfling = "STOUTHALFLING_8d545fa1-8416-493f-8325-7d112bceced8",
  ReallyStoutHalfling = "REALLY_STOUTHALFLING_058df86a-97b6-4dc4-a246-a1db65ff3c0f",
  Gnome = "GNOME_1f0551f3-d769-47a9-b02b-5d3a8c51978c",
  ReallyGnome = "REALLY_GNOME_42483542-7915-4de5-a7d9-ac0d15fe301c",
  RockGnome = "ROCKGNOME_664cc044-a0ea-43a1-b21f-d8cad7721102",
  ReallyRockGnome = "REALLY_ROCKGNOME_df697d73-5469-405a-aa95-6e1e720c5ee6",
  DeepGnome = "DEEPGNOME_2bbc3217-3d8c-46e6-b599-a0f1c9063f9a",
  ReallyDeepGnome = "REALLY_DEEPGNOME_17d29357-beba-4096-accc-c28bdea88fda",
  ForestGnome = "FORESTGNOME_09518377-4ea1-4ce2-b8e8-61477c26ebdd",
  ReallyForestGnome = "REALLY_FORESTGNOME_b0401c02-70b3-47f5-998f-8d440ad6954f",
  Dwarf = "DWARF_486a2562-31ae-437b-bf63-30393e18cbdd",
  ReallyDwarf = "REALLY_DWARF_ad129444-0f41-4114-9ee5-2b9902d7ca8d",
  HillDwarf = "HILLDWARF_534098fa-601d-4f6e-8c4e-b3a8d4b1f141",
  ReallyHillDwarf = "REALLY_HILLDWARF_9a92ac6d-b7cc-4ccb-8965-074c6b36a342",
  MountainDwarf = "MOUNTAINDWARF_1dc20a7a-00e7-4126-80ad-aa1152a2136c",
  ReallyMountainDwarf = "REALLY_MOUNTAINDWARF_18659b46-73ae-49d2-85a8-7e6cc43ce94f",
  Duergar = "DUERGARDWARF_78adf3cd-4741-47a8-94f6-f3d322432591",
  ReallyDuergar = "REALLY_DUERGARDWARF_45b007f7-f4f6-46e2-9480-395a49b87ef3",
  Dragonborn = "DRAGONBORN_02e5e9ed-b6b2-4524-99cd-cb2bc84c754a",
  ReallyDragonborn = "REALLY_DRAGONBORN_39783f17-8484-46a6-aa3b-f3d51122e5f3",
  HalfOrc = "HALFORC_3311a9a9-cdbc-4b05-9bf6-e02ba1fc72a3",
  ReallyHalfOrc = "REALLY_HALFORC_ab3eff19-d094-4102-88bd-d097b6b6e4f0",
  Aasimar = "AASIMAR_41c6cdc9-aff5-46ae-afc4-aa0ccd9cd201",
  ReallyAasimar = "REALLY_AASIMAR_2fddf7dd-f79b-4998-882c-d7257badbfe6",
  Genasi = "GENASI_48d7b679-dffd-4f68-a306-adac19de8acf",
  ReallyGenasi = "REALLY_GENASI_aa68eccb-7875-436f-881e-c3775eee37f6",
  DisplacerBeast = "DISPLACER_BEAST_ba107054-6d0a-45de-93bc-06d72d4feeb3",
  ReallyDisplacerBeast = "REALLY_DISPLACER_BEAST_8fac3253-331c-4b9f-95fb-e2196fd1bc8d",
  -- Origins
  ReallyMinsc = "REALLY_MINSC_aeb694fc-83fb-452d-819a-b97ba442dc42",
  ReallyHalsin = "REALLY_HALSIN_9b8709f9-8d2a-4b4e-a465-8505c561d7f5",
  ReallyJaheira = "REALLY_JAHEIRA_8457eb5f-036c-4143-b6cf-447a9f555c7a",
  Astarion = "ASTARION_23a46e79-e73c-4043-940f-cb0aace9ab2e",
  ReallyAstarion = "REALLY_ASTARION_ffd08582-7396-4cac-bcd4-8f9cd0fd8ef3",
  ReallyLaezel = "REALLY_LAEZEL_b5682d1d-c395-489c-9675-1f9b0c328ea5",
  ReallyShadowheart = "REALLY_SHADOWHEART_642d2aee-e3df-47e3-9f47-bbcd441bb9e0",
  ReallyGale = "REALLY_GALE_9b0354c0-56d9-4723-8034-918ac9abab19",
  ReallyWyll = "REALLY_WYLL_5f40def5-d3ec-4698-a367-01a339888956",
  DarkUrge = "DARK_URGE_fe825e69-1569-471f-9b3f-28fd3b929683",
  ReallyDarkUrge = "REALLY_DARK_URGE_cd611d7d-b67d-42b4-a75c-a0c6091ef8a2",
  -- Creatures
  Humanoid = "HUMANOID_7fbed0d4-cabc-4a9d-804e-12ca6088a0a8",
  Undead = "UNDEAD_33c625aa-6982-4c27-904f-e47029a9b140",
  Beast = "BEAST_890b5a2a-e773-48df-b191-c887d87bec16",
  AggressiveBeast = "AGGRESSIVEBEAST_1ed04fb5-e654-4dbf-893c-a795952e77e1",
  Monster = "MONSTER_90101158-141e-4896-8e60-f8db03f6dde3",
  Elemental = "ELEMENTAL_196351e2-ff25-4e2b-8560-222ac6b94a54",
  Ghost = "GHOST_3def9d73-7c73-487b-8111-d1df1dce076e",
  Construct = "CONSTRUCT_22e5209c-eaeb-40dc-b6ef-a371794110c2",
  Summon = "SUMMON_26c78224-a4c1-43e4-b943-75e7fa1bfa41",
  IntellectDevourer = "INTELLECT_DEVOURER_69901347-23cb-4f60-abf3-527f23cdf0db",
  Dragon = "DRAGON_95748ad1-cda2-4c0c-a9b2-875899327693",
  Myconid = "MYCONID_480f5568-7c49-45e4-9543-7c06e43bdf52",
  MindFlayer = "MINDFLAYER_8ee4d870-3f6b-466c-968f-ab0ba2be6229",
  Automaton = "AUTOMATON_0f9099e9-a4d8-4b17-b2e5-e6f74eeb79b4",
  Deva = "DEVA_f3045a08-1739-4776-9d7b-6c52b55ba8a9",
  Shadow = "SHADOW_a04374d9-c40f-4c41-a10f-7f3ca496b16a",
  SteelWatch = "STEEL_WATCHER_bc09a589-e076-4b2d-8b86-f8cccbb64449",
  Bugbear = "BUGBEAR_dc18a33a-bdd1-41be-8ad5-e6fca917b54e",
  Goblin = "GOBLIN_608597d9-bf00-4ede-aabe-767457280925",
  Harpy = "HARPY_4ce54d09-192f-4090-a5fd-72b84c9400de",
  Hobgoblin = "HOBGOBLIN_193938c4-ed1c-4648-af3f-f4b59152ec92",
  Kuotoa = "KUOTOA_e3763301-199e-4022-8813-da1bb4eb9542",
  Ogre = "OGRE_cb53ec1e-af17-4dc2-bb28-2ac56d7eba96",
  Skeleton = "SKELETON_146a89e7-802f-4926-bc21-4a41c2478502",
  Civilian = "CIVILIAN_71120d5d-3853-46e4-9762-33f59aa6b4ae",
  Guard = "GUARD_0b52f35e-fb1f-4865-bcd2-5d21ef7343cd",
  BadAssCivilian = "BADASSCIVILIAN_91f4b379-63a2-40e9-a509-7b9b2f90e4c8",
  NotMessingAround = "NOT_MESSING_AROUND_542b58f0-42ad-4157-a28e-27434e0e7b18",
  Kid = "KID_ee978587-6c68-4186-9bfc-3b3cc719a835",
  Trader = "TRADER_91d5ebc6-91ea-44db-8a51-216860d69b5b",
  FullCeremorph = "FULL_CEREMORPH_3797bfc4-8004-4a19-9578-61ce0714cc0b",
  PartialCeremorph = "PARTIAL_CEREMORPH_c0cd4ed8-11d1-4fb1-ae3a-3a14e41267c8"
}

-- Prevent DBOperationLoop from proceeding if DB won't work right with specific types
Globals.TypeBlacklist = {
  DB_RaceTags = { "Background", "Deity" },
  DB_RaceMetaTags = { "Background", "Deity" }
}
