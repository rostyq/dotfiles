$wtDir = Get-ChildItem -Path "$env:LOCALAPPDATA\Packages" -Filter "Microsoft.WindowsTerminal*"
$settingsFile = Join-Path -Path $wtDir.FullName -ChildPath "LocalState\settings.json"
$settingsRaw = Get-Content -Raw -Path $settingsFile
$settings = $settingsRaw `
    -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*','' `
    -replace '(?ms)/\*.*?\*/','' `
    -replace '"powershell.exe"','"powershell.exe -NoLogo"' `
    | ConvertFrom-Json

$mysettings = Get-Content -Raw -Path "$PSScriptRoot\settings.json" | ConvertFrom-Json

$settings.profiles.defaults = $mysettings.profiles.defaults
$settings.actions = $mysettings.actions
$settings.schemes = $settings.schemes + $mysettings.schemes

ConvertTo-Json $settings -Depth 10 | Out-File $settingsFile -Encoding "UTF8"
