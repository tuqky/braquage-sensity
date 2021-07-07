robberiesConfiguration = {

    reseller = {
        model = "a_m_y_business_02",
        waitingScenario = "WORLD_HUMAN_AA_SMOKE",
        busyScenario = "WORLD_HUMAN_CLIPBOARD",
        randomizeLocation = function()
            return robberiesConfiguration.reseller.locations[math.random(1, #robberiesConfiguration.reseller.locations)]
        end,
        locations = {
            { vector = vector3(526.7914, -1655.516, 29.35936), heading = 51.27629852295, },
            { vector = vector3(2392.104, 3321.546, 47.71572), heading = 311.78579711914, },
        },
    },

    items = {
        ["TV"] = { name = "Téléviseur", resellerValue = 5000, timeToTake = 10 },
        ["CLOTHS"] = { name = "Vêtements", resellerValue = 3000, timeToTake = 15 },
        ["CLOTHSRICHE"] = { name = "Vêtements de Luxe", resellerValue = 7500, timeToTake = 15 },
        ["ECOMP"] = { name = "Composants électroniques", resellerValue = 2000, timeToTake = 4 },
        ["ORANGE"] = { name = "Fruits", resellerValue = 5000, timeToTake = 2 },
        ["TELEPHONE"] = { name = "iPhone", resellerValue = 9000, timeToTake = 4 },
        ["PORNO"] = { name = "Magasine Pornographique", resellerValue = 2500, timeToTake = 1 },
        ["PARFUM"] = { name = "Parfum Channel", resellerValue = 1000, timeToTake = 3 },
        ["TV4K60FPS"] = { name = "TV 4K 60FPS", resellerValue = 5650, timeToTake = 15 },
        ["BOITEBIJOUX"] = { name = "Boite a Bijoux", resellerValue = 6000, timeToTake = 20 },
        ["PCPORTABLE"] = { name = "Asus Rog 144Hz", resellerValue = 3500, timeToTake = 10 },
        ["TABLEAU"] = { name = "Tableau Pablo Picasso", resellerValue = 1500, timeToTake = 10 },
        ["ECRANMAC"] = { name = "Ecran Mac", resellerValue = 4000, timeToTake = 8 },
        ["JAGUAR"] = { name = "Jaguar", resellerValue = 2400, timeToTake = 5 },
        ["PERCEUSE"] = { name = "Perceuse", resellerValue = 3000, timeToTake = 6 },
        ["DEVICE"] = { name = "Device", resellerValue = 5000, timeToTake = 15 },
        ["BOITEOUTILS"] = { name = "Boite a Outils", resellerValue = 4000, timeToTake = 8 },
        ["COMPRESSEUR"] = { name = "Compresseur", resellerValue = 4000, timeToTake = 12 },
        ["PEINTURE"] = { name = "Peinture", resellerValue = 2400, timeToTake = 5 },
        ["CHEVRE"] = { name = "Chevre Mécanique", resellerValue = 3500, timeToTake = 10 },
        ["ASPIRATEUR"] = { name = "Aspirateur Mécanique", resellerValue = 3000, timeToTake = 6 },
        ["BANSHEE"] = { name = "Tableau Banshee", resellerValue = 4000, timeToTake = 8 },
        ["OUTILS"] = { name = "Outils", resellerValue = 2400, timeToTake = 5 },
        ["FEUILLECASH"] = { name = "Feuille Cash", resellerValue = 4000, timeToTake = 8 },
        ["DOCUMENTS"] = { name = "Documents Labo", resellerValue = 500, timeToTake = 2 },
        ["BILLET"] = { name = "Billet Cash Factory", resellerValue = 500, timeToTake = 2 },
        ["BILLET1"] = { name = "Pile de Cash", resellerValue = 550, timeToTake = 10 },
        ["BILLET2"] = { name = "Billet de Cash Factory", resellerValue = 3500, timeToTake = 7 },
        ["PRODUITCOC"] = { name = "Produit Cocaine", resellerValue = 4000, timeToTake = 8 },
        ["COCAINA"] = { name = "Cocaine", resellerValue = 2000, timeToTake = 4 },
        ["CANNA"] = { name = "Cannabis", resellerValue = 5000, timeToTake = 2 },
        ["CANNATRAIT"] = { name = "Cannabis traite", resellerValue = 2000, timeToTake = 5 },
        ["DISQUEDUR"] = { name = "Disque Dur", resellerValue = 2000, timeToTake = 5 },
        ["TABLEAUPAUVRE"] = { name = "Tableau Décoration", resellerValue = 2500, timeToTake = 8 },
        ["BROSSEADENTS"] = { name = "Brosse a dents", resellerValue = 500, timeToTake = 2 },
        ["SECHECHEVEUX"] = { name = "Seche Cheveux", resellerValue = 500, timeToTake = 3 },
        ["LIVRES"] = { name = "Livres", resellerValue = 2000, timeToTake = 8 },
        ["JACK"] = { name = "Bouteille de Jack", resellerValue = 500, timeToTake = 2 },
    },

    minPolice = 1,
    houseRobRegen = 60, -- m
    houses = {
        -- Première maison
        {
            name = "Poor #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(240.8298, -1687.964, 29.69962),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Motel 1
        {
            name = "Motel #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(-681.9152, 5770.784, 17.511),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Motel 2
        {
            name = "Motel #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(-702.0698, 5765.004, 17.511),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Motel 3
        {
            name = "Motel #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(-157.1198, 6409.256, 31.9159),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Motel 4
        {
            name = "Motel #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(-99.66008, 6347.676, 35.50074),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Nord Maison 1
        {
            name = "Nord #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(1674.7, 4681.23, 43.0554),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Nord Maison 2
        {
            name = "Nord #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(265.2054, -1001.77, -99.00856),
            exitVector = vector3(266.169, -1007.436, -101.0086),
            outdoorVector = vector3(1639.286, 4879.404, 42.14068),
            objects = {
                { object = "TV", position = vector3(257.1346, -995.7486, -99.00864) },
                { object = "CLOTHS", position = vector3(259.9006, -1004.098, -99.00864) },
                { object = "TV", position = vector3(262.5348, -1002.594, -99.00864) },
                { object = "ECOMP", position = vector3(265.494, -995.7602, -99.00866) },
            },
        },

        -- Nord Maison 3
        {
            name = "Nord #3",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(346.4078, -1008.204, -99.19616),
            exitVector = vector3(346.4414, -1012.916, -99.19616),
            outdoorVector = vector3(2566.722, 4283.192, 41.97382),
            objects = {
                { object = "TV4K60FPS", position = vector3(338.2112, -996.6988, -99.19618) },
                { object = "CLOTHS", position = vector3(350.8822, -993.5962, -99.1961) },
                { object = "TABLEAUPAUVRE", position = vector3(347.1834, -998.0684, -99.19618) },
                { object = "BROSSEADENTS", position = vector3(347.2348, -994.2006, -99.19616) },
                { object = "SECHECHEVEUX", position = vector3(351.13, -999.2594, -99.19614) },
                { object = "PORNO", position = vector3(349.491, -997.4902, -99.1962) },
                { object = "LIVRES", position = vector3(345.3794, -997.0596, -99.19622) },
                { object = "JACK", position = vector3(342.3002, -1001.524, -99.19622) },
            },
        },

        -- Nord Maison 4
        {
            name = "Nord #5",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(346.4078, -1008.204, -99.19616),
            exitVector = vector3(346.4414, -1012.916, -99.19616),
            outdoorVector = vector3(-130.752, 6551.894, 29.87264),
            objects = {
                { object = "TV4K60FPS", position = vector3(338.2112, -996.6988, -99.19618) },
                { object = "CLOTHS", position = vector3(350.8822, -993.5962, -99.1961) },
                { object = "TABLEAUPAVURE", position = vector3(347.1834, -998.0684, -99.19618) },
                { object = "BROSSEADENTS", position = vector3(347.2348, -994.2006, -99.19616) },
                { object = "SECHECHEVEUX", position = vector3(351.13, -999.2594, -99.19614) },
                { object = "PORNO", position = vector3(349.491, -997.4902, -99.1962) },
                { object = "LIVRES", position = vector3(345.3794, -997.0596, -99.19622) },
                { object = "JACK", position = vector3(342.3002, -1001.524, -99.19622) },
            },
        },

        -- Nord Maison 5
        {
            name = "Nord #4",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(346.4078, -1008.204, -99.19616),
            exitVector = vector3(346.4414, -1012.916, -99.19616),
            outdoorVector = vector3(-9.582162, 6654.23, 31.70472),
            objects = {
                { object = "TV4K60FPS", position = vector3(338.2112, -996.6988, -99.19618) },
                { object = "CLOTHS", position = vector3(350.8822, -993.5962, -99.1961) },
                { object = "TABLEAUPAUVRE", position = vector3(347.1834, -998.0684, -99.19618) },
                { object = "BROSSEADENTS", position = vector3(347.2348, -994.2006, -99.19616) },
                { object = "SECHECHEVEUX", position = vector3(351.13, -999.2594, -99.19614) },
                { object = "PORNO", position = vector3(349.491, -997.4902, -99.1962) },
                { object = "LIVRES", position = vector3(345.3794, -997.0596, -99.19622) },
                { object = "JACK", position = vector3(342.3002, -1001.524, -99.19622) },
            },
        },

        -- Nord Maison 6
        {
            name = "Nord #6",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(346.4078, -1008.204, -99.19616),
            exitVector = vector3(346.4414, -1012.916, -99.19616),
            outdoorVector = vector3(1663.948, 4662.01, 43.38696),
            objects = {
                { object = "TV4K60FPS", position = vector3(338.2112, -996.6988, -99.19618) },
                { object = "CLOTHS", position = vector3(350.8822, -993.5962, -99.1961) },
                { object = "TABLEAUPAUVRE", position = vector3(347.1834, -998.0684, -99.19618) },
                { object = "BROSSEADENTS", position = vector3(347.2348, -994.2006, -99.19616) },
                { object = "SECHECHEVEUX", position = vector3(351.13, -999.2594, -99.19614) },
                { object = "PORNO", position = vector3(349.491, -997.4902, -99.1962) },
                { object = "LIVRES", position = vector3(345.3794, -997.0596, -99.19622) },
                { object = "JACK", position = vector3(342.3002, -1001.524, -99.19622) },
            },
        },

        -- Maison Riche 1
        {
            name = "Riche #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 120, -- s
            maximumTime = 120, -- s
            interiorVector = vector3(-777.5488, 341.9992, 196.686),
            exitVector = vector3(-773.6672, 341.977, 196.6862),
            outdoorVector = vector3(1725.408, 4642.51, 43.87548),
            objects = {
                { object = "TV4K60FPS", position = vector3(-779.6634, 319.3302, 195.8864) },
                { object = "CLOTHSRICHE", position = vector3(-764.6378, 329.1428, 199.4864) },
                { object = "ORANGE", position = vector3(-777.1876, 326.4014, 196.086) },
                { object = "TELEPHONE", position = vector3(-771.2246, 321.666, 195.8864) },
                { object = "TELEPHONE", position = vector3(-766.079, 335.7744, 196.086) },
                { object = "PORNO", position = vector3(-764.871, 323.0866, 199.4864) },
                { object = "PARFUM", position = vector3(-755.423, 325.4242, 199.4862) },
                { object = "PCPORTABLE", position = vector3(-762.1242, 335.2344, 196.086) },
                { object = "BOITEBIJOUX", position = vector3(-771.9574, 337.6924, 196.086) },
                { object = "TABLEAU", position = vector3(-776.226, 324.1056, 196.086) },
            },
        },

        -- Maison Riche 2
        {
            name = "Riche #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 120, -- s
            maximumTime = 120, -- s
            interiorVector = vector3(-784.3764, 315.772, 187.9134),
            exitVector = vector3(-787.276, 315.7646, 187.9134),
            outdoorVector = vector3(-784.2752, 351.514, 87.99814),
            objects = {
                { object = "TV4K60FPS", position = vector3(-780.8774, 337.8312, 187.5458) }, --
                { object = "CLOTHSRICHE", position = vector3(-796.345, 328.3752, 190.7158) }, --
                { object = "ORANGE", position = vector3(-783.7184, 331.432, 187.313) }, --
                { object = "TELEPHONE", position = vector3(-793.3706, 342.2482, 187.1136) }, --
                { object = "TELEPHONE", position = vector3(-795.026, 321.9664, 187.3132) },
                { object = "PORNO", position = vector3(-796.241, 334.7748, 190.7158) }, --
                { object = "PARFUM", position = vector3(-805.5186, 332.3148, 190.716) }, --
                { object = "PCPORTABLE", position = vector3(-798.8718, 322.4496, 187.3132) }, --
                { object = "BOITEBIJOUX", position = vector3(-792.746, 327.9212, 187.3136) }, --
                { object = "TABLEAU", position = vector3(-792.5564, 331.6132, 190.7158) }, --
            },
        },

        -- Maison Riche 3
        {
            name = "Riche #3",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 120, -- s
            maximumTime = 120, -- s
            interiorVector = vector3(-777.4834, 342.0986, 196.686),
            exitVector = vector3(-773.6206, 342.0016, 196.686),
            outdoorVector = vector3(-86.5315, 389.8796, 112.4302),
            objects = {
                { object = "TV4K60FPS", position = vector3(-779.6314, 319.3058, 195.8864) }, --
                { object = "CLOTHSRICHE", position = vector3(-761.8034, 328.6992, 199.4864) }, --
                { object = "ORANGE", position = vector3(-777.2782, 326.4036, 196.0858) }, --
                { object = "TELEPHONE", position = vector3(-771.2618, 321.6182, 195.8864) }, --
                { object = "TELEPHONE", position = vector3(-766.0906, 335.7724, 196.086) }, --
                { object = "PORNO", position = vector3(-764.7526, 323.1398, 199.4866) }, --
                { object = "PARFUM", position = vector3(-755.3206, 325.4084, 199.4864) }, --
                { object = "PCPORTABLE", position = vector3(-762.1782, 335.2968, 196.086) }, --
                { object = "BOITEBIJOUX", position = vector3(-772.0466, 337.7218, 196.086) }, --
                { object = "TABLEAU", position = vector3(-765.6724, 319.4306, 199.4864) }, --
            },
        },

        -- Bureau Riche 1
        {
            name = "Bureau #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(-140.4686, -620.5236, 168.8202),
            exitVector = vector3(-142.7184, -614.0834, 168.8202),
            outdoorVector = vector3(-129.0316, -648.6616, 40.50116),
            objects = {
                { object = "TV4K60FPS", position = vector3(-69.90284, -808.3606, 243.3862) }, --
                { object = "CLOTHSRICHE", position = vector3(-78.27862, -812.5248, 243.386) }, --
                { object = "JAGUAR", position = vector3(-81.7245, -803.8906, 243.386) }, --
                { object = "ECRANMAC", position = vector3(-73.2182, -815.7464, 243.3858) }, --
                { object = "BOITEBIJOUX", position = vector3(-81.55038, -806.832, 243.386) }, --
                { object = "TABLEAU", position = vector3(-75.95762, -810.328, 243.3858) }, --
                { object = "ECRANMAC", position = vector3(-78.65768, -802.3368, 243.4008) }, --
            },
        },

        -- Garage Riche 1
        {
            name = "Garage #1",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(-71.70308, -810.876, 285),
            exitVector = vector3(-68.6049, -814.2468, 285),
            outdoorVector = vector3(-16.39944, -839.5754, 30.4999),
            objects = {
                { object = "TV4K60FPS", position = vector3(-66.46716, -827.0558, 285.5952) }, --
                { object = "PERCEUSE", position = vector3(-70.18714, -818.1954, 285.0004) }, --
                { object = "DEVICE", position = vector3(-71.1857, -829.0366, 285.038) }, --
                { object = "BOITEOUTILS", position = vector3(-73.69374, -829.5616, 285.0004) }, --
                { object = "COMPRESSEUR", position = vector3(-85.82538, -822.742, 285.0002) }, --
                { object = "PEINTURE", position = vector3(-85.83998, -818.7216, 285.0004) }, --
                { object = "TELEPHONE", position = vector3(-80.31374, -810.1864, 285.0004) },
            },
        },

        -- Garage 2
        {
            name = "Garage #2",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 5, -- s
            policeBlipDuration = 60, -- s
            maximumTime = 60, -- s
            interiorVector = vector3(970.8108, -2987.516, -39.64694),
            exitVector = vector3(978.2974, -3020.484, -39.647),
            outdoorVector = vector3(-537.5072, -2229.364, 6.39402),
            objects = {
                { object = "PCPORTABLE", position = vector3(964.4238, -3003.466, -39.6399) }, --
                { object = "PERCEUSE", position = vector3(966.1428, -2991.736, -39.64694) }, --
                { object = "BOITEOUTILS", position = vector3(968.4878, -3002.664, -39.647) }, --
                { object = "COMPRESSEUR", position = vector3(953.1106, -2989.274, -39.647) }, --
                { object = "PEINTURE", position = vector3(963.4792, -3010.13, -39.64694) }, --
                { object = "TELEPHONE", position = vector3(-80.31374, -810.1864, 285.0004) },
                { object = "CHEVRE", position = vector3(976.539, -2990.106, -39.64694) }, --
                { object = "CHEVRE", position = vector3(956.5088, -2998.604, -39.647) }, --
                { object = "CLOTHS", position = vector3(958.7682, -3005.198, -39.6399) }, --
                { object = "PORNO", position = vector3(964.2178, -2999.944, -39.6399) }, --
                { object = "ASPIRATEUR", position = vector3(966.0716, -3005.506, -39.6399) }, --
                { object = "BANSHEE", position = vector3(965.0658, -3008.826, -39.6399) }, --
            },
        },

        -- Cash Factory
        {
            name = "Cash Factory",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 45, -- s
            maximumTime = 45, -- s
            interiorVector = vector3(1118.828, -3193.366, -40.39172),
            exitVector = vector3(1138.066, -3199.168, -39.66572),
            outdoorVector = vector3(-1168.51, -1388.548, 4.94343),
            objects = {
                { object = "PCPORTABLE", position = vector3(1129.622, -3194.12, -40.39632) }, --
                { object = "OUTILS", position = vector3(1132.364, -3193.478, -40.3924) }, --
                { object = "FEUILLECASH", position = vector3(1138.232, -3196.974, -39.66566) }, --
                { object = "DOCUMENTS", position = vector3(1138.146, -3193.772, -40.39424) }, --
                { object = "BILLET", position = vector3(1122.294, -3194.492, -40.39862) }, --
                { object = "BILLET1", position = vector3(1116.11, -3193.868, -40.39484) }, --
                { object = "BILLET2", position = vector3(1119.408, -3197.792, -40.3934) }, --
                { object = "BOITEOUTILS", position = vector3(1124.042, -3197.948, -40.39284) }, --
            },
        },

        -- Cocaine Factory
        {
            name = "Cocaine Factory",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 35, -- s
            maximumTime = 35, -- s
            interiorVector = vector3(1103.692, -3195.924, -38.99348),
            exitVector = vector3(1088.682, -3187.698, -38.99346),
            outdoorVector = vector3(671.883, -2672.822, 6.298528),
            objects = {
                { object = "PCPORTABLE", position = vector3(1087.2, -3194.29, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1090.2, -3199.1, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1093.632, -3199.132, -38.99346) }, --
                { object = "COCAINA", position = vector3(1091.14, -3194.926, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1094.75, -3192.866, -38.99346) }, --
                { object = "COCAINA", position = vector3(1094.302, -3196.656, -38.99346) }, --
            },
        },

        -- Cocaine Factory Nord
        {
            name = "Cocaine Factory Nord",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 35, -- s
            maximumTime = 35, -- s
            interiorVector = vector3(1103.692, -3195.924, -38.99348),
            exitVector = vector3(1088.682, -3187.698, -38.99346),
            outdoorVector = vector3(1803.518, 3913.95, 37.05692),
            objects = {
                { object = "PCPORTABLE", position = vector3(1087.2, -3194.29, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1090.2, -3199.1, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1093.632, -3199.132, -38.99346) }, --
                { object = "COCAINA", position = vector3(1091.14, -3194.926, -38.99346) }, --
                { object = "PRODUITCOC", position = vector3(1094.75, -3192.866, -38.99346) }, --
                { object = "COCAINA", position = vector3(1094.302, -3196.656, -38.99346) }, --
            },
        },

        -- Cannabis Factory Sud
        {
            name = "Cannabis Factory",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 35, -- s
            maximumTime = 35, -- s
            interiorVector = vector3(1066.304, -3183.504, -39.16356),
            exitVector = vector3(1038.656, -3195.322, -38.17104),
            outdoorVector = vector3(1006.64, -1556.226, 30.83838),
            objects = {
                { object = "PCPORTABLE", position = vector3(1044.498, -3194.874, -38.15806) },
                { object = "DOCUMENTS", position = vector3(1060.154, -3182.03, -39.16484) }, --
                { object = "CANNA", position = vector3(1060.554, -3193.036, -39.16132) }, --
                { object = "CANNA", position = vector3(1056.658, -3190.968, -39.1286) }, --
                { object = "CANNA", position = vector3(1052.072, -3196.384, -39.0736) }, --
                { object = "CANNA", position = vector3(1061.608, -3203.794, -39.0575) }, --
                { object = "CANNATRAIT", position = vector3(1037.522, -3205.362, -38.17022) }, --
                { object = "CANNATRAIT", position = vector3(1032.93, -3205.422, -38.18042) }, --
                { object = "BOITEOUTILS", position = vector3(1031, -3203.178, -38.19374) }, --
            },
        },

        -- Cannabis Factory Nord
        {
            name = "Cannabis Factory",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 35, -- s
            maximumTime = 35, -- s
            interiorVector = vector3(1066.304, -3183.504, -39.16356),
            exitVector = vector3(1038.656, -3195.322, -38.17104),
            outdoorVector = vector3(471.0886, 3552.888, 33.23854),
            objects = {
                { object = "PCPORTABLE", position = vector3(1044.498, -3194.874, -38.15806) },
                { object = "DOCUMENTS", position = vector3(1060.154, -3182.03, -39.16484) }, --
                { object = "CANNA", position = vector3(1060.554, -3193.036, -39.16132) }, --
                { object = "CANNA", position = vector3(1056.658, -3190.968, -39.1286) }, --
                { object = "CANNA", position = vector3(1052.072, -3196.384, -39.0736) }, --
                { object = "CANNA", position = vector3(1061.608, -3203.794, -39.0575) }, --
                { object = "CANNATRAIT", position = vector3(1037.522, -3205.362, -38.17022) }, --
                { object = "CANNATRAIT", position = vector3(1032.93, -3205.422, -38.18042) }, --
                { object = "BOITEOUTILS", position = vector3(1031, -3203.178, -38.19374) }, --
            },
        },

        -- Disque Factory
        {
            name = "Disque Factory",
            authority = "police",
            timeToGoToReseller = 20, -- minutes
            copsCalledAfter = 1, -- s
            policeBlipDuration = 75, -- s
            maximumTime = 75, -- s
            interiorVector = vector3(2168.066, 2921.382, -81.07538),
            exitVector = vector3(2154.776, 2921.03, -81.07544),
            outdoorVector = vector3(716.8566, -654.5134, 27.78896),
            objects = {
                { object = "PCPORTABLE", position = vector3(2150.97, 2912.512, -84.79998) }, --
                { object = "DOCUMENTS", position = vector3(2170.796, 2915.308, -81.07524) }, --
                { object = "DOCUMENTS", position = vector3(2175.326, 2926.682, -81.07528) }, --
                { object = "DOCUMENTS", position = vector3(2167.364, 2917.368, -81.07524) }, --
                { object = "DOCUMENTS", position = vector3(2150.844, 2928.112, -84.79998) }, --
                { object = "DISQUEDUR", position = vector3(2171.134, 2933.936, -84.71926) }, --
                { object = "DISQUEDUR", position = vector3(2175.532, 2934.642, -84.71926) }, --
                { object = "DISQUEDUR", position = vector3(2179.888, 2935.426, -84.71926) }, --
                { object = "DISQUEDUR", position = vector3(2194.5, 2921.08, -84.7193) }, --
                { object = "DISQUEDUR", position = vector3(2198.466, 2920.78, -84.7193) }, --
                { object = "DISQUEDUR", position = vector3(2206.206, 2920.7, -84.7193) }, --
                { object = "DISQUEDUR", position = vector3(2207.432, 2911.256, -84.72436) }, --
                { object = "DISQUEDUR", position = vector3(2195.862, 2912.488, -84.72436) }, --
                { object = "DISQUEDUR", position = vector3(2181.472, 2906.07, -84.72434) }, --
                { object = "DISQUEDUR", position = vector3(2173.938, 2907.32, -84.72434) }, --
                { object = "DISQUEDUR", position = vector3(2166.186, 2908.056, -84.71932) }, --
                { object = "DISQUEDUR", position = vector3(2163.558, 2907.708, -84.71926) }, --
                { object = "DISQUEDUR", position = vector3(2154.848, 2906.172, -84.71926) }, --
                { object = "BOITEOUTILS", position = vector3(2150.816, 2914.642, -84.79998) }, --
            },
        },


    },
}


bijouterie = {

    reseller = {
        model = "a_m_m_ktown_01",
        waitingScenario = "WORLD_HUMAN_AA_SMOKE",
        busyScenario = "WORLD_HUMAN_CLIPBOARD",
        randomizeLocation = function()
            return bijouterie.reseller.locations[math.random(1,#bijouterie.reseller.locations)]
        end,
        locations = {
            {vector = vector3(514.5304, -478.0764, 24.75167),heading = 177.752700},
            {vector = vector3(876.2545, -1353.153, 26.32077),heading = 83.8308},
            {vector = vector3(448.2462, -2760.927, 7.100906),heading = 147.36956},

        },
    },

    items = {
        ["TV"] = {name = "Téléviseur", resellerValue = 1000, timeToTake = 30},
        ["CLOTHS"] = {name = "Vêtements", resellerValue = 1050, timeToTake = 15},
        ["CLOTHSRICHE"] = {name = "Vêtements de Luxe", resellerValue = 200, timeToTake = 15},
        ["ECOMP"] = {name = "Composants électroniques", resellerValue = 200, timeToTake = 4},
        ["ORANGE"] = {name = "Fruits", resellerValue = 150, timeToTake = 2},
        ["TELEPHONE"] = {name = "iPhone", resellerValue = 100, timeToTake = 4},
        ["PORNO"] = {name = "Magasine Pornographique", resellerValue = 800, timeToTake = 1},
        ["PARFUM"] = {name = "Parfum Channel", resellerValue = 450, timeToTake = 3},
        ["TV4K60FPS"] = {name = "TV 4K 60FPS", resellerValue = 4800, timeToTake = 45},
        ["BOITEBIJOUX"] = {name = "Boite a Bijoux", resellerValue = 200, timeToTake = 20},
        ["PCPORTABLE"] = {name = "Asus Rog 144Hz", resellerValue = 650, timeToTake = 10},
        ["TABLEAU"] = {name = "Tableau Pablo Picasso", resellerValue = 1750, timeToTake = 30},
        ["ECRANMAC"] = {name = "Ecran Mac", resellerValue = 500, timeToTake = 8},
        ["JAGUAR"] = {name = "Jaguar", resellerValue = 500, timeToTake = 5},
        ["PERCEUSE"] = {name = "Perceuse", resellerValue = 500, timeToTake = 6},
        ["DEVICE"] = {name = "Device", resellerValue = 1500, timeToTake = 15},
        ["BOITEOUTILS"] = {name = "Boite a Outils", resellerValue = 750, timeToTake = 8},
        ["COMPRESSEUR"] = {name = "Compresseur", resellerValue = 100, timeToTake = 12},
        ["PEINTURE"] = {name = "Peinture", resellerValue = 450, timeToTake = 5},
        ["CHEVRE"] = {name = "Chevre Mécanique", resellerValue = 850, timeToTake = 10},
        ["ASPIRATEUR"] = {name = "Aspirateur Mécanique", resellerValue = 700, timeToTake = 6},
        ["BANSHEE"] = {name = "Tableau Banshee", resellerValue = 500, timeToTake = 8},
        ["OUTILS"] = {name = "Outils", resellerValue = 450, timeToTake = 5},
        ["FEUILLECASH"] = {name = "Feuille Cash", resellerValue = 790, timeToTake = 8},
        ["DOCUMENTS"] = {name = "Documents Labo", resellerValue = 380, timeToTake = 2},
        ["BILLET"] = {name = "Billet Cash Factory", resellerValue = 380, timeToTake = 2},
        ["BILLET1"] = {name = "Pile de Cash", resellerValue = 1890, timeToTake = 10},
        ["BILLET2"] = {name = "Billet de Cash Factory", resellerValue = 500, timeToTake = 7},
        ["PRODUITCOC"] = {name = "Produit Cocaine", resellerValue = 600, timeToTake = 8},
        ["COCAINA"] = {name = "Cocaine", resellerValue = 600, timeToTake = 4},
        ["CANNA"] = {name = "Cannabis", resellerValue = 190, timeToTake = 2},
        ["CANNATRAIT"] = {name = "Cannabis traite", resellerValue = 210, timeToTake = 5},
        ["DISQUEDUR"] = {name = "Disque Dur", resellerValue = 250, timeToTake = 5},
        ["TABLEAUPAUVRE"] = {name = "Tableau Décoration", resellerValue = 500, timeToTake = 8},
        ["BROSSEADENTS"] = {name = "Brosse a dents", resellerValue = 250, timeToTake = 2},
        ["SECHECHEVEUX"] = {name = "Seche Cheveux", resellerValue = 500, timeToTake = 3},
        ["LIVRES"] = {name = "Livres", resellerValue = 500, timeToTake = 8},
        ["JACK"] = {name = "Bouteille de Jack", resellerValue = 500, timeToTake = 2},
        ["DIAMAND"] = {name = "Diamand", resellerValue = 500, timeToTake = 2},
        ["BIJOUX"] = {name = "Bijoux", resellerValue = 1500, timeToTake = 2},
    },

    houseRobRegen = 60,
    houses = {	
        -- Première maison	
        {	
            name = "Bijouterie", 	
            authority = "police",	
            timeToGoToReseller = 15, -- minutes	
            copsCalledAfter = 15,  -- s	
            policeBlipDuration = 320, -- s	
            maximumTime = 140,  -- s	
            interiorVector = vector3(-621.8723, -230.7309, 38.05701), 	
            exitVector = vector3(-621.8723, -230.7309, 38.05701),
            outdoorVector = vector3(-621.8723, -230.7309, 38.05701), 	
            objects = {	
                {object = "DIAMAND", position =  vector3(-624.6018, -230.9577, 38.05701)},	
                {object = "BIJOUX", position = vector3(-622.8931, -233.1772, 38.05701)},	
                {object = "DIAMAND", position = vector3(-621.7556, -233.8941, 38.05701)},	
                {object = "BIJOUX", position = vector3(-620.26, -233.5221, 38.05701)},
                {object = "DIAMAND", position =  vector3(-619.1845, -232.0077, 38.05701)},	
                {object = "BIJOUX", position = vector3(-619.5304, -230.5356, 38.05701)},	
                {object = "DIAMAND", position = vector3(-621.1028, -228.3954, 38.05701)},	
                {object = "BIJOUX", position = vector3(-622.3821, -227.6258, 38.05701)},
                {object = "DIAMAND", position = vector3(-623.739, -227.9265, 38.05701)},	
                {object = "BIJOUX", position = vector3(-624.957, -229.506, 38.05701)},	
                {object = "DIAMAND", position = vector3(-627.9797, -233.8233, 38.05701)},	
                {object = "BIJOUX", position = vector3(-626.7889, -233.0419, 38.05701)},
                {object = "DIAMAND", position = vector3(-626.6754, -235.3371, 38.05701)},	
                {object = "BIJOUX", position = vector3(-625.8195, -234.6, 38.05701)},	
                {object = "DIAMAND", position = vector3(-625.5807, -237.7281, 38.05701)},	
                {object = "BIJOUX", position = vector3(-626.4658, -238.3487, 38.05701)},

                {object = "DIAMAND", position = vector3(-620.2473, -234.368, 38.05701)},	
                {object = "BIJOUX", position = vector3(-619.1404, -233.5637, 38.05701)},	
                {object = "DIAMAND", position = vector3(-617.5134, -230.6698, 38.05701)},	
                {object = "BIJOUX", position = vector3(-618.4537, -229.3655, 38.05696)},
                {object = "DIAMAND", position = vector3(-619.7352, -227.6594, 38.05698)},	
                {object = "BIJOUX", position = vector3(-625.8195, -234.6, 38.05701)},	
                {object = "DIAMAND", position = vector3(-625.5807, -237.7281, 38.05701)},	
                {object = "BIJOUX", position = vector3(-620.4867, -226.5737, 38.05698)},
            },	
        },	
    },
}