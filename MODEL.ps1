$h = "$env:LOCALAPPDATA\hermes"
$o = "$env:USERPROFILE\model.txt"
$c = Get-Content "$h\config.yaml"
$on = $false
$res = @()
foreach ($l in $c) {
  if ($l -match '^model:') { $on = $true }
  elseif ($on -and $l -match '^[A-Za-z]') { $on = $false }
  if ($on -and $l -notmatch '^\s*#') { $res += $l }
}
$res | Out-File $o -Encoding utf8
$res | Select-Object -First 6
