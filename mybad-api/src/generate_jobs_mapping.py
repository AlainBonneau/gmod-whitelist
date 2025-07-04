import re

jobs_lua_path = "jobs.lua"    # Adapter le chemin si besoin
output_path = "jobs_mapping.ts"

job_pattern = re.compile(r'DarkRP\.createJob\("([^"]+)",\s*{')
jobs = []

with open(jobs_lua_path, encoding="utf-8") as f:
    lua_content = f.read()

for match in job_pattern.finditer(lua_content):
    job_name = match.group(1)
    jobs.append(job_name)

# On suppose que l'ID = position dans la liste + premier ID (parfois 1, parfois 0, parfois 2)
# Pour savoir à partir de combien commence l'ID dans ta BDD, regarde le plus petit job_id de ta table

FIRST_ID = 4  # Adapter selon le premier job_id de ta BDD
mapping_lines = []

for idx, job_name in enumerate(jobs):
    mapping_lines.append(f'  {FIRST_ID + idx}: "{job_name}"')

with open(output_path, "w", encoding="utf-8") as f:
    f.write("// Auto-generated jobs mapping\n")
    f.write("export const jobsMapping = {\n")
    f.write(",\n".join(mapping_lines))
    f.write("\n} as const;\n")

print(f"Mapping généré ({len(jobs)} jobs) dans {output_path} ✅")
