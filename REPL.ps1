$roots = @("$env:USERPROFILE\Desktop\msg spam", "$env:USERPROFILE\Desktop\clic ads")
$o = "$env:USERPROFILE\repl.txt"
"debut" | Out-File $o -Encoding utf8
$n = 0
foreach ($r in $roots) {
  Get-ChildItem $r -Recurse -File | Where-Object { $_.Extension -in ".bat", ".py", ".json", ".md" } | ForEach-Object {
    $c = Get-Content $_.FullName -Raw
    if ($c -and $c -match 'Users\\googl') {
      $c = $c.Replace('C:\Users\googl\Desktop', "$env:USERPROFILE\Desktop")
      Set-Content -Path $_.FullName -Value $c -NoNewline -Encoding utf8
      $_.FullName | Out-File $o -Append -Encoding utf8
      $n++
    }
  }
}
"fichiers=$n" | Out-File $o -Append -Encoding utf8
type $o
