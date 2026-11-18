$o = "$env:USERPROFILE\hash.txt"
"=== tailles ===" | Out-File $o -Encoding utf8
(Get-Item "$env:USERPROFILE\Desktop\msg spam\lsa_plomberie_v3.py").Length | Out-File $o -Append
(Get-Item "$env:USERPROFILE\Desktop\clic ads\ads_cliqueur.py").Length | Out-File $o -Append
"=== md5 ===" | Out-File $o -Append
(Get-FileHash "$env:USERPROFILE\Desktop\msg spam\lsa_plomberie_v3.py" -Algorithm MD5).Hash.ToLower() | Out-File $o -Append
(Get-FileHash "$env:USERPROFILE\Desktop\clic ads\ads_cliqueur.py" -Algorithm MD5).Hash.ToLower() | Out-File $o -Append
"=== compile ===" | Out-File $o -Append
Push-Location "$env:USERPROFILE\Desktop\msg spam"
& ".venv\Scripts\python.exe" -m py_compile lsa_plomberie_v3.py demarrer.py bilan.py
"lsa_rc=$LASTEXITCODE" | Out-File $o -Append
Pop-Location
Push-Location "$env:USERPROFILE\Desktop\clic ads"
& ".venv\Scripts\python.exe" -m py_compile ads_cliqueur.py moteur.py commun.py bilan.py demarrer.py
"clic_rc=$LASTEXITCODE" | Out-File $o -Append
Pop-Location
type $o
