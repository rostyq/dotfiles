New-Item `
    -Path "$env:LOCALAPPDATA\nvim" `
    -ItemType SymbolicLink `
    -Value (
        Join-Path -Path (Split-Path $PSScriptRoot -Parent) -ChildPath "nvim" `
        ).ToString() `
    -Force

iwr -useb "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force

nvim `
    +PlugInstall `
    +CocInstall `
        coc-json `
        coc-tsserver `
        coc-rust-analyzer `
        coc-python `
    +qa!
