Import-Module posh-git
Import-Module oh-my-posh

Set-PoshPrompt -Theme pure
$DefaultUser = $env:USERNAME

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
