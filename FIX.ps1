$p = "$env:LOCALAPPDATA\hermes\cron\jobs.json"
$j = Get-Content $p -Raw
$j = $j.Replace('C:\\Users\\googl\\Desktop\\clic ads', 'C:\\Users\\Administrator\\Desktop\\CLICKADS')
$j = $j.Replace('C:\\Users\\googl\\Desktop\\msg spam', 'C:\\Users\\Administrator\\Desktop\\msg spam')
$j = $j.Replace('C:/Users/googl/Desktop', 'C:/Users/Administrator/Desktop')
Set-Content -Path $p -Value $j -Encoding utf8
"restant_googl=" + (Select-String -Path $p -Pattern 'googl' -SimpleMatch).Count
"jobs=" + ((Get-Content $p -Raw | ConvertFrom-Json).jobs).Count
