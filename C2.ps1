$o = "$env:USERPROFILE\chrome.log"
$msi = "$env:SystemDrive\chrome.msi"
"msi=" + (Test-Path $msi) | Out-File $o -Encoding utf8
$p = Start-Process msiexec -ArgumentList "/i `"$msi`" /qn /norestart" -Wait -PassThru
"exit=" + $p.ExitCode | Out-File $o -Append -Encoding utf8
foreach ($x in @("$env:ProgramFiles\Google\Chrome\Application\chrome.exe", "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe", "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe")) {
  $x + " => " + (Test-Path $x) | Out-File $o -Append -Encoding utf8
}
"fin" | Out-File $o -Append -Encoding utf8
