$h = "$env:LOCALAPPDATA\hermes"
$o = "$env:USERPROFILE\state.txt"
"=== MODEL ===" | Out-File $o -Encoding utf8
$c = Get-Content "$h\config.yaml"
for ($i = 0; $i -lt $c.Count; $i++) {
  if ($c[$i] -match '^model:') { $c[$i..([Math]::Min($i + 14, $c.Count - 1))] | Out-File $o -Append -Encoding utf8 }
}
"=== TELEGRAM ===" | Out-File $o -Append -Encoding utf8
$t = (Select-String -Path "$h\.env" -Pattern '^TELEGRAM_BOT_TOKEN=').Line
if ($t) {
  $tok = $t.Substring($t.IndexOf('=') + 1).Trim()
  ("token_len=" + $tok.Length) | Out-File $o -Append -Encoding utf8
  $me = curl.exe -s ("https://api.telegram.org/bot" + $tok + "/getMe")
  ("getMe=" + $me) | Out-File $o -Append -Encoding utf8
} else { "pas de token" | Out-File $o -Append -Encoding utf8 }
(Select-String -Path "$h\.env" -Pattern '^TELEGRAM_ALLOWED_USERS=').Line | Out-File $o -Append -Encoding utf8
"=== SKILLS/MEM ===" | Out-File $o -Append -Encoding utf8
("skills=" + (Get-ChildItem "$h\skills" -Recurse -File -Filter SKILL.md -ErrorAction SilentlyContinue).Count) | Out-File $o -Append -Encoding utf8
("mem=" + (Test-Path "$h\memories\MEMORY.md")) | Out-File $o -Append -Encoding utf8
"=== LOG ===" | Out-File $o -Append -Encoding utf8
Get-Content "$h\logs\gateway.log" -Tail 8 -ErrorAction SilentlyContinue | Out-File $o -Append -Encoding utf8
"=== FIN ===" | Out-File $o -Append -Encoding utf8
