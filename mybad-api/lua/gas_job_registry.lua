-- Place ce fichier dans garrysmod/lua/autorun/server/gas_job_registry.lua

local MYSQL_HOST = "your_database_host"       -- Ton host MySQL
local MYSQL_USER = "your_sql_user"        -- Ton user MySQL
local MYSQL_PASS = "your_sql_password" -- Ton mot de passe MySQL
local MYSQL_DB   = "your_sql_database"    -- Ta base MySQL
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
    createTable.onSuccess = function()
        -- On vide la table avant de la remplir (très important pour garder la synchro !)
        local truncate = db:query("TRUNCATE TABLE gas_job_registry;")
        truncate.onSuccess = function()
            for _, job in ipairs(RPExtraTeams) do
                local job_id = job.team -- CORRIGÉ : Utilise l'ID unique du métier !
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
    createTable.onError = function(_, err)
        print("[gas_job_registry] Erreur création table: " .. tostring(err))
    end
    createTable:start()
end

db.onConnected = function()
    print("[gas_job_registry] Connexion MySQL OK")
    timer.Simple(10, syncJobs) -- On attend 10s que RPExtraTeams soit chargé
end

db.onConnectionFailed = function(_, err)
    print("[gas_job_registry] Échec connexion MySQL:", err)
end

db:connect()
