#!/bin/bash
#
# Run all dotfiles installers and related setup

set -e          # Exit immediately if a command exits with a non-zero status
set -o pipefail # Exit if any command in a pipeline fails

# Utility functions for consistent output
info() {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
  printf "\r\033[2K  [ \033[0;31mFAIL\033[0m ] %s\n" "$1"
  echo ''
  exit 1
}

export DOTFILES="$HOME/.dotfiles"

info "Updating package lists"
sudo apt update || fail "Failed to update package lists"

info "Running all dotfiles installers"
cd "$(dirname "$0")/.." || fail "Failed to change directory"
find -H "$DOTFILES" -maxdepth 4 -name 'install.sh' -not -path '*.git*' -exec sh -c 'FILE="$1"; "$FILE"' _ {} \; || fail "Failed to run dotfiles installers"

if [[ "$(uname)" == "Linux" ]]; then
  info "Installing Zsh Autosuggestions"
  ZSH_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  if [[ ! -d "$ZSH_PLUGIN_DIR" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGIN_DIR" || fail "Failed to clone zsh-autosuggestions"
    success "Zsh Autosuggestions installed"
  else
    success "Zsh Autosuggestions already installed"
  fi

  info "Installing Zsh Syntax Highlighting"
  ZSH_HIGHLIGHT_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  if [[ ! -d "$ZSH_HIGHLIGHT_DIR" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_HIGHLIGHT_DIR" || fail "Failed to clone zsh-syntax-highlighting"
    success "Zsh Syntax Highlighting installed"
  else
    success "Zsh Syntax Highlighting already installed"
  fi

  info "Installing packages from specific/linux/packages.txt"
  PACKAGE_FILE="$DOTFILES/specific/linux/packages.txt"
  if [[ -f "$PACKAGE_FILE" ]]; then
    xargs sudo apt -y -qq install <"$PACKAGE_FILE" || fail "Failed to install packages from $PACKAGE_FILE"
    success "Packages installed from $PACKAGE_FILE"
  else
    fail "Package list not found at $PACKAGE_FILE"
  fi

  info "Installing Lambda Stack"
  wget -nv -O- https://lambdalabs.com/install-lambda-stack.sh | sh - || fail "Failed to install Lambda Stack"
  success "Lambda Stack installed"
fi

success "Dotfiles setup completed successfully!"
