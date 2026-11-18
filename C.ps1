$paths = @("C:\Program Files\Google\Chrome\Application\chrome.exe", "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe", "$env:ProgramFiles(x86)\Google\Chrome\Application\chrome.exe")
foreach ($p in $paths) { $p + " => " + (Test-Path $p) }
