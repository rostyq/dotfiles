# install chocolatey
try {
    choco --version
} catch {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# packages
choco install `
    microsoft-build-tools `
    cmake `
    llvm `
    jetbrainsmono `
    python `
    nodejs `
    neovim `
    git-lfs.install `
    --yes
