#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

sudo apt update
xargs sudo apt -y -qq install < ~/.dotfiles/Linux/packages.txt
