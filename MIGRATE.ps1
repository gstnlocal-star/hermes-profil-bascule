$ErrorActionPreference = 'Stop'
$h = "$env:LOCALAPPDATA\hermes"
$log = "$env:USERPROFILE\migr.log"
function W($m) { "$(Get-Date -f HH:mm:ss) $m" | Out-File $log -Append -Encoding utf8 }
"debut" | Out-File $log -Encoding utf8
$z = "$env:USERPROFILE\profil.zip"
if (!(Test-Path $z)) { W "zip absent"; exit 1 }
$st = "$env:USERPROFILE\migr_x"
if (Test-Path $st) { Remove-Item $st -Recurse -Force }
Expand-Archive -Path $z -DestinationPath $st -Force
W "zip extrait"
if (!(Test-Path "$h\skills")) { New-Item -ItemType Directory -Path "$h\skills" | Out-Null }
if (!(Test-Path "$h\memories")) { New-Item -ItemType Directory -Path "$h\memories" | Out-Null }
Copy-Item "$st\hermes\skills\*" "$h\skills\" -Recurse -Force
Copy-Item "$st\hermes\memories\*" "$h\memories\" -Recurse -Force
Copy-Item "$st\hermes\SOUL.md" "$h\SOUL.md" -Force
Copy-Item "$st\hermes\jobs.json" "$h\cron\jobs.json" -Force
W ("skills=" + (Get-ChildItem "$h\skills" -Recurse -File -Filter SKILL.md).Count)
W ("user=" + (Test-Path "$h\memories\USER.md"))
W "fin"
