Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

# symlink to powershell profile
New-Item `
    -Path $PROFILE `
    -ItemType SymbolicLink `
    -Value (
        Join-Path -Path $PSScriptRoot -ChildPath "profile.ps1" `
        ).ToString() `
    -Force
