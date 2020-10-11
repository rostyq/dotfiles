$POWERSHELL_DIR = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell"
# symlink for powershell and powershell core using one profile
New-Item `
    -Path (Join-Path -Path $env:USERPROFILE -ChildPath "Documents\PowerShell") `
    -ItemType SymbolicLink `
    -Value $POWERSHELL_DIR `
    -Force

# symlink to powershell profile
New-Item `
    -Path (Join-Path -Path $POWERSHELL_DIR -ChildPath "Microsoft.PowerShell_profile.ps1") `
    -ItemType SymbolicLink `
    -Value (
        Join-Path -Path $PSScriptRoot -ChildPath "profile.ps1" `
        ).ToString() `
    -Force


Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
