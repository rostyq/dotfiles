$wtDir = Get-ChildItem -Path "$env:LOCALAPPDATA\Packages" -Filter "Microsoft.WindowsTerminal*"
$settingsFile = Join-Path -Path $wtDir.FullName -ChildPath "LocalState\settings.json"
$settingsRaw = Get-Content -Raw -Path $settingsFile
$settings = $settingsRaw `
    -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*','' `
    -replace '(?ms)/\*.*?\*/','' `
    -replace '"powershell.exe"','"powershell.exe -NoLogo"' `
    | ConvertFrom-Json

$settings.profiles.defaults = Get-Content -Raw -Path "$PSScriptRoot\defaults.json" | ConvertFrom-Json
ConvertTo-Json $settings -Depth 4 | Out-File $settingsFile -Encoding "UTF8"
