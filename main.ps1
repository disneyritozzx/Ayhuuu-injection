Add-Type -AssemblyName System.Security
$data = Get-Content "$env:USERPROFILE\AppData\Local\Roblox\LocalStorage\robloxcookies.dat" | ConvertFrom-Json
$decoded = [System.Convert]::FromBase64String($data.CookiesData)
$unprotected = [System.Security.Cryptography.ProtectedData]::Unprotect($decoded, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
[System.Text.Encoding]::UTF8.GetString($unprotected)
