#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update
xargs sudo apt -y -qq install < ~/.dotfiles/specific/linux/packages.txt
