#!/bin/bash

sudo apt update

# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

cd "$(dirname "$0")"/.. || exit
find -H "$DOTFILES" -maxdepth 4 -name 'install.sh' -not -path '*.git*' -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

info "adding zsh extensions"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

info "adding vscode repo"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

info "install the packages inside specific/linux/packages.txt"
xargs sudo apt -y -qq install < ~/.dotfiles/specific/linux/packages.txt

info "installing lambda stack"
wget -nv -O- https://lambdalabs.com/install-lambda-stack.sh | sh -



