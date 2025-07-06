-- [SparckyDev] Sync jobs to MySQL for API mapping [SparckyDev]
-- Put this file in garrysmod/lua/autorun/server/gas_job_registry.lua
-- Place ce fichier dans garrysmod/lua/autorun/server/gas_job_registry.lua

local MYSQL_HOST = "your-mysql-host.com" -- Replace with your MySQL server address / Remplace par l'adresse de ton serveur MySQL
local MYSQL_USER = "your_mysql_user" -- Replace with your MySQL username / Remplace par ton nom d'utilisateur MySQL
local MYSQL_PASS = "your_mysql_password" -- Replace with your MySQL password / Remplace par ton mot de passe MySQL
local MYSQL_DB   = "your_database_name" -- Replace with your MySQL database name / Remplace par le nom de ta base de données MySQL
local MYSQL_PORT = 3306

require("mysqloo")
local db = mysqloo.connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB, MYSQL_PORT)

local function syncJobs()
    if not RPExtraTeams then
        print("[gas_job_registry] RPExtraTeams not loaded, retrying in 5s...")
        timer.Simple(5, syncJobs)
        return
    end

    -- Création de la table si elle existe pas
    local createTable = db:query([[
        CREATE TABLE IF NOT EXISTS gas_job_registry (
            job_id INT PRIMARY KEY,
            name VARCHAR(255),
            command VARCHAR(255)
        )
    ]])

    -- On supprime la table si elle existe déjà
    createTable.onSuccess = function()
        local truncate = db:query("TRUNCATE TABLE gas_job_registry;")
        truncate.onSuccess = function()
            for i, job in ipairs(RPExtraTeams) do
                -- **** ICI ON UTILISE job.team ****
                local job_id = job.team
                local name = db:escape(job.name)
                local command = db:escape(job.command or "")
                local q = db:query(string.format(
                    [[INSERT INTO gas_job_registry (job_id, name, command) VALUES (%d, '%s', '%s')
                    ON DUPLICATE KEY UPDATE name='%s', command='%s']],
                    job_id, name, command, name, command
                ))
                q:start()
            end
            print("[gas_job_registry] Table synchronisée (" .. #RPExtraTeams .. " jobs)")
        end
        truncate:start()
    end

    -- En cas d'erreur lors de la création de la table
    createTable.onError = function(_, err)
        print("[gas_job_registry] Erreur création table: " .. tostring(err))
    end
    createTable:start()
end

db.onConnected = function()
    print("[gas_job_registry] Connexion MySQL OK")
    timer.Simple(10, syncJobs)
end

db.onConnectionFailed = function(_, err)
    print("[gas_job_registry] Échec connexion MySQL:", err)
end

db:connect()