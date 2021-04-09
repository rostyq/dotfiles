ln -s $(dirname $(realpath $0)) $HOME/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim \
    +PlugInstall \
    +CocInstall \
        coc-json \
        coc-tsserver \
        coc-rust-analyzer \
        coc-python \
    +qa!
