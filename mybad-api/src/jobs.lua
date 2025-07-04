--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

------------------- Gendarmerie -------------------
TEAM_GENDARME = DarkRP.createJob("Gendarme", {
    color = Color(0, 0, 255),
    model = {"models/player/rico/gendarmerie_01.mdl",
        "models/player/rico/gendarmerie_02.mdl",
        "models/player/rico/gendarmerie_03.mdl"},
    description = [[
        Vous êtes gendarme, protégez la ville ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card"
    },
    command = "gendarme",
    max = 10,
    salary = 425,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 6,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(155)
        ply:SetMaxArmor(155)
    end,
})

TEAM_GENDARME = DarkRP.createJob("ERI", {
    color = Color(0, 0, 255),
    model = {"models/darkley/motard_01.mdl",
        "models/darkley/motard_02.mdl",
        "models/darkley/motard_03.mdl"},
    description = [[
        Equipes Rapides d'Intervention ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card"
    },
    command = "eri",
    max = 4,
    salary = 850,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 5,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
    end,
})

TEAM_GENDARME = DarkRP.createJob("PSIG", {
    color = Color(0, 0, 255),
    model = {"models/player/eliot/gendmod_01.mdl",
        "models/player/eliot/gendmod_02.mdl",
        "models/player/eliot/gendmod_03.mdl"},
    description = [[
        Peloton de Surveillance et d'Intervention de la Gendarmerie ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card"
    },
    command = "psig",
    max = 4,
    salary = 850,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 3,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})

TEAM_GENDARME = DarkRP.createJob("Officier Gendarme", {
    color = Color(0, 0, 255),
    model = {"models/player/eliot/gendmod_01.mdl",
        "models/player/eliot/gendmod_02.mdl",
        "models/player/eliot/gendmod_03.mdl"},
    description = [[
        Peloton de Surveillance et d'Intervention de la Gendarmerie ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card",
        
    },
    command = "officiergendarme",
    max = 4,
    salary = 1250,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 2,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})

TEAM_GENDARME = DarkRP.createJob("PDGN", {
    color = Color(0, 0, 255),
    model = "models/player/eliot/gendmod_02.mdl",
    description = [[
        Pilote de Drone de la Gendarmerie Nationale ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card",
        "swep_drone_controller"
    },
    command = "pdgn",
    max = 4,
    salary = 850,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 4,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})

TEAM_GENDARME = DarkRP.createJob("Général Gendarme", {
    color = Color(0, 0, 255),
    model = {"models/player/darkley/f_gend_01_960.mdl",
        "models/player/darkley/f_gend_02_960.mdl",
        "models/player/darkley/f_gend_03_960.mdl"},
    description = [[
        Vous êtes Général gendarme, protégez la ville ! 
    ]],
    weapons = {
        "idcard",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card",
        "swep_drone_controller"
    },
    command = "generalgm",
    max = 2,
    salary = 2000,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Gendarme",
    canDemote = false,
    sortOrder = 1,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(255)
        ply:SetMaxArmor(255)
    end,
})
------------------- GIGN -------------------

TEAM_GENDARME = DarkRP.createJob("GIGN", {
    color = Color(0, 0, 255),
    model = "models/player/PMC_4/PMC__12.mdl",
    description = [[
        Vous êtes GIGN, protégez la ville ! 
    ]],
    weapons = {
        "idcard",
        "m9k_an94",
        "weapon_rpt_finebook",
        "weapon_rpt_handcuff",
        "weapon_rpt_stungun",
        "stunstick",
        "door_ram",
        "glorifiedbanking_card"
    },
    command = "gign",
    max = 1,
    salary = 425,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "GIGN",
    canDemote = false,
    sortOrder = 7,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(250)
        ply:SetMaxArmor(250)
    end,
})

------------------- Service Publique -------------------
TEAM_CITOYEN = DarkRP.createJob("Citoyen", {
    color = Color(0, 255, 0),
    model = {
        "models/player/Group01/male_02.mdl",
        "models/player/mossman.mdl"
    },
    description = [[
        Vous etes un simple citoyen
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "citoyen",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Service Publique",
    canDemote = false,
})

TEAM_LEGAL = DarkRP.createJob("Cuisinier", {
    color = Color(30, 255, 0),
    model = "models/fearless/chef1.mdl",
    description = [[
        Vous êtes cuisinier nourrissez la ville
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "cuisinier",
    max = 4,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Service Publique",
    canDemote = false,
})


TEAM_LEGAL = DarkRP.createJob("Banquier", {
    color = Color(30, 255, 0),
    model = "models/sentry/sentryoldmob/oldgoons/sentrybusi1male6pm.mdl",
    description = [[
        Vous êtes le banquier de la ville
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "banquier",
    max = 2,
    salary = 550,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Service Publique",
    canDemote = false,
})

TEAM_ARMURIER = DarkRP.createJob("Armurier", {
    color = Color(30, 255, 0),
    model = "models/player/leet.mdl",
    description = [[
        Vous etes un vendeur d'arme officiel 
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "armurier",
    max = 2,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Service Publique",
    canDemote = false,
})

------------------- Service Santé -------------------
TEAM_SANTE = DarkRP.createJob("Medecin", {
    color = Color(0, 250, 246),
    model = {
        "models/berkeyz/tenue_samu_01.mdl",
        "models/berkeyz/tenue_samu_02.mdl",
        "models/berkeyz/tenue_samu_03.mdl"
    },
    description = [[
        Vous êtes le médecin de la ville, occupez vous de soigner les maladies et les blessures des citoyens 
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card",
        "defibrillator_advanced",
        "med_kit_advanced"
    },
    command = "medecin",
    max = 4,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Service Santé",
    canDemote = false,
})

TEAM_SANTE = DarkRP.createJob("SAMU", {
    color = Color(0, 250, 246),
    model = {
        "models/berkeyz/tenue_samu_01.mdl",
        "models/berkeyz/tenue_samu_02.mdl",
        "models/berkeyz/tenue_samu_03.mdl"
    },
    description = [[
        Vous êtes ambulancier, roulez vite mais bien pour sauver des vies !
    ]],
    weapons = {},
    command = "ambulancier",
    max = 4,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Service Santé",
    canDemote = false,
})

------------------- Union Criminelle -------------------
TEAM_MAFIEUX = DarkRP.createJob("Mafieux", {
    color = Color(118, 118, 112),
    model = {
        "models/fearless/mafia02.mdl",
        "models/fearless/mafia04.mdl",
        "models/fearless/mafia06.mdl",
        "models/fearless/mafia07.mdl",
        "models/fearless/mafia09.mdl"
    },
    description = [[
        Vous êtes un mafieux,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "mafieux",
    max = 6,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 6
})

TEAM_PARRAIN = DarkRP.createJob("Parrain de la mafia", {
    color = Color(118, 118, 112),
    model = {
        "models/vito.mdl"
    },
    description = [[
        Vous êtes le Parrain dirigez votre groupe,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "parrain",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 5
})

TEAM_GANGSTER = DarkRP.createJob("Gangster", {
    color = Color(118, 118, 112),
    model = {
        "models/sentry/sentryoldmob/greaser/sentrygreasemale2pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale4pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale7pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale9pm.mdl"
    },
    description = [[
        Vous êtes un Gangster,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "Gangster",
    max = 6,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 2
})

TEAM_CGANGSTER = DarkRP.createJob("Chef des gangsters", {
    color = Color(118, 118, 112),
    model = {
"models/sentry/sentryoldmob/greaser/sentrygreasemale2pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale4pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale7pm.mdl",
        "models/sentry/sentryoldmob/greaser/sentrygreasemale9pm.mdl"
    },
    description = [[
        Vous êtes le chef des gangsters dirigez votre groupe,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "CGangster",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 1
})

TEAM_YAKUZA = DarkRP.createJob("Yakuza", {
    color = Color(118, 118, 112),
    model = {
        "models/SD/Players/[dbs_grappler_2].mdl",
        "models/SD/Players/[dbs_grappler].mdl",
        "models/SD/Players/[dbs_quick]-head_quick_dbs.mdl",
        "models/SD/Players/[dbs_quick]-head_striker_dbs.mdl",
        "models/SD/Players/[dbs_striker]-head_quick_dbs.mdl"
    },
    description = [[
        Vous êtes un Yakuza
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "Yakuza",
    max = 6,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 4
})

TEAM_CYAKUZA = DarkRP.createJob("Chef Yakuza", {
    color = Color(118, 118, 112),
    model = {
        "models/SD/Players/[dbs_brawler]-head_brawler_dbs.mdl",
        "models/SD/Players/[dbs_brawler_2]-head_brawler_dbs.mdl"
    },
    description = [[
        Vous êtes le chef des Yakuzas dirigez votre groupe,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "CYakuza",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 3
})

TEAM_CRIPS = DarkRP.createJob("Crips", {
    color = Color(118, 118, 112),
    model = {
        "models/player/cripz/slow_1.mdl",
        "models/player/cripz/slow_2.mdl"
    },
    description = [[
        Vous êtes un Crips,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "crips",
    max = 6,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 8
})

TEAM_CCRIPS = DarkRP.createJob("Chef Crips", {
    color = Color(118, 118, 112),
    model = {
        "models/player/cripz/slow_3.mdl"
    },
    description = [[
        Vous êtes le chef des Crips dirigez votre groupe
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "ccrips",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 7
})

TEAM_CBLOODS = DarkRP.createJob("Chef Bloods", {
    color = Color(118, 118, 112),
    model = {
        "models/player/bloodz/slow_3.mdl"
    },
    description = [[
        Vous êtes le chef des Bloods dirigez votre groupe
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "cbloods",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 9
})

TEAM_BLOODS = DarkRP.createJob("Bloods", {
    color = Color(118, 118, 112),
    model = {
        "models/player/bloodz/slow_1.mdl",
        "models/player/bloodz/slow_2.mdl",
    },
    description = [[
        Vous êtes un Bloods,
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "bloods",
    max = 6,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Union Criminelle",
    canDemote = false,
    sortOrder = 10
})

------------------- Illégal -------------------
TEAM_TRAFIC = DarkRP.createJob("Marchand d'armes", {
    color = Color(255, 139, 0),
    model = "models/player/leet.mdl",
    description = [[
        Vous etes un vendeur d'arme illégal 
    ]],
    weapons = {
        "idcard",
        "glorifiedbanking_card"
    },
    command = "armurier_illegal",
    max = 2,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Illégal",
    canDemote = false,
})

TEAM_VOLEUR = DarkRP.createJob("Voleur", {
    color = Color(255, 139, 0),
    model = {
        "models/player/Group03/male_06.mdl",
        "models/player/Group03/male_09.mdl",
        "models/player/Group01/male_01.mdl"
    },
    description = [[
        Vous êtes un voleur,
    ]],
    weapons = {
        "lockpick",
        "idcard",
        "glorifiedbanking_card",
        "keypad_cracker",
        "realistic_hook"
    },
    command = "voleur",
    max = 2,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Illégal",
    canDemote = false,
})

--[[
    Staff Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STAFF = DarkRP.createJob("Staff", {
    color = Color(0, 0, 0),
    model = "models/kryptonite/thanos_endgame/thanos_endgame.mdl",
    description = [[
        Vous êtes staff
    ]],
    weapons = {},
    command = "staff",
    max = 0,
    salary = 45000,
    admin = 1,
    vote = false,
    hasLicense = true,
    category = "Staff",
    canDemote = false,
    customCheck = function(ply) 
        return CLIENT or table.HasValue({"moderateur", "admin", "superadmin", "moderateur-test"}, ply:GetUserGroup()) 
    end,
    CustomCheckFailMsg = "Vous n'êtes pas WhiteList",
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITOYEN
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_GENDARME] = true,
    [TEAM_CHIEF] = false,
    [TEAM_MAYOR] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)

