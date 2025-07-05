-- This script synchronizes the job registry with a MySQL database.
-- It creates a table if it doesn't exist, truncates it, and inserts or updates job entries
-- based on the RPExtraTeams table from the server.

-- You have to put this script in your Garry's Mod Lua directory, typically under `garrysmod/lua/autorun/server/`.

-- Your configuration for MySQL connection
local MYSQL_HOST = "your.mysql.host" -- Replace with your MySQL host
local MYSQL_USER = "your_mysql_user" -- Replace with your MySQL username
local MYSQL_PASS = "your_mysql_password" -- Replace with your MySQL password
local MYSQL_DB   = "your_database_name" -- Replace with your MySQL database name
local MYSQL_PORT = 3306 -- Replace with your MySQL port (default is 3306)

require("mysqloo")
local db = mysqloo.connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB, MYSQL_PORT)

local function syncJobs()
    if not RPExtraTeams then
        print("[gas_job_registry] RPExtraTeams not loaded, retrying in 5s...")
        timer.Simple(5, syncJobs)
        return
    end

    local createTable = db:query([[
        CREATE TABLE IF NOT EXISTS gas_job_registry (
            job_id INT PRIMARY KEY,
            name VARCHAR(255),
            command VARCHAR(255)
        )
    ]])
    createTable.onSuccess = function()
        local truncate = db:query("TRUNCATE TABLE gas_job_registry;")
        truncate.onSuccess = function()
            for _, job in ipairs(RPExtraTeams) do
                local job_id = job.team -- L’ID global utilisé partout
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

-- Made by SparckyDev -- 
