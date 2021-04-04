#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

sudo apt update

#zsh autosugest
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

#install docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker "${USER}"

#install the packages inside specific/linux/packages.txt
xargs sudo apt -y -qq install < ~/.dotfiles/specific/linux/packages.txt
