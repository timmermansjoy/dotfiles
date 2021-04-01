#!/bin/bash
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

xargs sudo apt-get -y install < ~/.dotfiles/Linux/packages.txt
