$ErrorActionPreference = 'Stop'
$d = "$env:USERPROFILE\Desktop"
$o = "$env:USERPROFILE\robots.log"
function W($m) { "$(Get-Date -f HH:mm:ss) $m" | Out-File $o -Append -Encoding utf8 }
"debut" | Out-File $o -Encoding utf8
Expand-Archive "$env:USERPROFILE\robots.zip" -DestinationPath $d -Force
W "extrait"
$p = "$d\msg spam"
if (Test-Path "$p\.venv") { Remove-Item "$p\.venv" -Recurse -Force }
py -3 -m venv "$p\.venv"
W "venv cree"
& "$p\.venv\Scripts\python.exe" -m pip install -q -r "$p\requirements.txt"
W ("pip rc=" + $LASTEXITCODE)
& "$p\.venv\Scripts\python.exe" -m playwright install chromium
W ("pw rc=" + $LASTEXITCODE)
& "$p\.venv\Scripts\python.exe" -c "import playwright, requests, PIL; print('imports ok')" | Out-File $o -Append -Encoding utf8
$q = "$d\clic ads"
if (Test-Path "$q\.venv") { Remove-Item "$q\.venv" -Recurse -Force }
py -3 -m venv "$q\.venv"
W "venv clicAds cree"
& "$q\.venv\Scripts\python.exe" -m pip install -q -r "$p\requirements.txt"
W ("pip2 rc=" + $LASTEXITCODE)
W "fin"
