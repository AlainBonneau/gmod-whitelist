import re

# Chemin vers ton jobs.lua
LUA_PATH = "jobs.lua"
TS_PATH = "jobs_mapping.ts"

with open(LUA_PATH, encoding="utf-8") as f:
    content = f.read()

# Regex pour trouver tous les jobs
job_blocks = re.findall(
    r'DarkRP\.createJob\("([^"]+)",\s*\{(.*?)\}\)', content, re.DOTALL
)

mapping = {}

for name, block in job_blocks:
    match = re.search(r'command\s*=\s*"([^"]+)"', block)
    if match:
        command = match.group(1)
        mapping[command] = name

# Générer le code TypeScript
ts_lines = [
    "// Ce fichier est généré automatiquement, ne pas modifier à la main.",
    "export const JOBS_MAPPING: Record<string, string> = {"
]
for cmd, name in mapping.items():
    ts_lines.append(f'    "{cmd}": "{name}",')
ts_lines.append("};\n")

with open(TS_PATH, "w", encoding="utf-8") as f:
    f.write('\n'.join(ts_lines))

print(f"Mapping généré ({len(mapping)} jobs) dans {TS_PATH} ✅")
