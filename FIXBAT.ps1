$n = 0
Get-ChildItem "$env:USERPROFILE\Desktop" -Recurse -File -Filter *.bat | Where-Object { $_.FullName -match 'msg spam|clic ads' } | ForEach-Object {
  $c = [System.IO.File]::ReadAllText($_.FullName)
  $c = $c.TrimStart([char]0xFEFF)
  [System.IO.File]::WriteAllText($_.FullName, $c, (New-Object System.Text.UTF8Encoding($false)))
  $n++
}
"bats_sans_bom=$n"
