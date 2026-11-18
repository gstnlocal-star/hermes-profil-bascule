$l = "$env:LOCALAPPDATA\hermes\logs\gateway.log"
$o = "$env:USERPROFILE\log.txt"
Get-Content $l -Tail 120 | Select-String -Pattern 'Telegram|polling|rror|Cron|cron' | ForEach-Object { $_.Line.Substring(0, [Math]::Min(150, $_.Line.Length)) } | Out-File $o -Encoding utf8
("lignes=" + (Get-Content $o).Count) | Out-File $o -Append
