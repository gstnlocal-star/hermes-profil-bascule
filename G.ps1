$p = "$env:LOCALAPPDATA\hermes\cron\jobs.json"
Select-String -Path $p -Pattern 'googl' -SimpleMatch | ForEach-Object { $_.LineNumber.ToString() + ": " + $_.Line.Trim() } | Out-File "$env:USERPROFILE\g.txt" -Encoding utf8
("jobs=" + ((Get-Content $p -Raw | ConvertFrom-Json).jobs).Count) | Out-File "$env:USERPROFILE\g.txt" -Append -Encoding utf8
type "$env:USERPROFILE\g.txt"
