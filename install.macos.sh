#!/bin/bash

# install brew
if ! command -v brew &> /dev/null
then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
  coreutils \
  python \
  node \
  neovim \
  kitty

brew tap homebrew/cask-fonts
brew install font-jetbrains-mono

