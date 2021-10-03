# install chocolatey
try {
    choco --version
} catch {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# packages
try {
    git --version
} catch {
    choco install git.install --yes --params "/NoGuiHereIntegration /NoShellHereIntegration"
}

choco install jetbrainsmononf --yes
choco install microsoft-build-tools --yes
choco install cmake --yes
choco install llvm --yes
choco install neovim --yes
choco install peazip --yes
choco install nvm --yes
choco install rust-ms --yes
