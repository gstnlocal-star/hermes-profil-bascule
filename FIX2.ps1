$p = "$env:LOCALAPPDATA\hermes\cron\jobs.json"
$j = Get-Content $p -Raw
$j = $j.Replace('CLICKADS', 'clic ads')
Set-Content -Path $p -Value $j -Encoding utf8
"restant_clickads=" + (Select-String -Path $p -Pattern 'CLICKADS' -SimpleMatch).Count
"googl=" + (Select-String -Path $p -Pattern 'googl' -SimpleMatch).Count
"jobs=" + ((Get-Content $p -Raw | ConvertFrom-Json).jobs).Count
