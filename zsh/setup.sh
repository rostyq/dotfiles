#!/bin/sh
ln -s "$(dirname $(realpath $0))/.zshrc" $HOME/.zshrc

# install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
