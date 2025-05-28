#!/bin/bash
#
# Hooks the dotfiles project to your home and shell config
export DOTFILES="$HOME/.dotfiles"

echo ''

info() {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  echo ''
  exit 1
}

setup_gitconfig() {
  if ! [ -f "$HOME/.gitconfig" ]; then
    info 'Setting up gitconfig'

    user ' - What is your GitHub author name?'
    read -r -e git_authorname
    user ' - What is your GitHub author email?'
    read -r -e git_authoremail

    sed \
      -e "s/AUTHORNAME/$git_authorname/g" \
      -e "s/AUTHOREMAIL/$git_authoremail/g" \
      "$DOTFILES/specific/git/gitconfig-local.symlink.example" >"$DOTFILES/specific/git/gitconfig-local.symlink" || fail "Error creating gitconfig"

    success 'Gitconfig setup completed'
  fi
}

link_file() {
  local SRC="$1" DST="$2"

  local overwrite='' backup='' skip=''
  local action

  if [ -e "$DST" ]; then
    local currentSrc
    currentSrc=$(readlink "$DST" 2>/dev/null)

    if [ "$currentSrc" == "$SRC" ]; then
      skip=true
    else
      user "File already exists: $DST ($(basename "$SRC")), what do you want to do?\n\
[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
      read -r -n 1 action
      echo ""

      case "$action" in
      o) overwrite=true ;;
      O) overwrite_all=true ;;
      b) backup=true ;;
      B) backup_all=true ;;
      s) skip=true ;;
      S) skip_all=true ;;
      *) ;;
      esac
    fi
  fi

  overwrite=${overwrite:-$overwrite_all}
  backup=${backup:-$backup_all}
  skip=${skip:-$skip_all}

  if [ "$overwrite" == "true" ]; then
    rm -rf "$DST" || fail "Failed to remove $DST"
    success "Removed $DST"
  fi

  if [ "$backup" == "true" ]; then
    mv "$DST" "${DST}.backup" || fail "Failed to backup $DST"
    success "Moved $DST to ${DST}.backup"
  fi

  if [ "$skip" == "true" ]; then
    success "Skipped $SRC"
    return
  fi

  ln -s "$SRC" "$DST" || fail "Failed to link $SRC to $DST"
  success "Linked $SRC to $DST"
}

install_dotfiles() {
  info 'Linking dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  find -H "$DOTFILES" -maxdepth 4 -name '*.symlink' -not -path '*.git*' | while read -r SRC; do
    local DST="$HOME/.$(basename "${SRC%.*}")"
    link_file "$SRC" "$DST"
  done
}

setup_gitconfig
install_dotfiles

# # check if M1 mac #TODO: check if still needed
# if [[ "$(uname -m)" == "arm64" ]]; then
#   info "Linking /opt/homebrew/bin to /usr/local/bin for M1 macs compatibility"
#   sudo ln -s /opt/homebrew/bin /usr/local/bin
# fi

info "Installing dependencies"
if source "$DOTFILES/scripts/dependencies-install.sh"; then
  success "Dependencies installed"
else
  fail "Error installing dependencies"
fi

if [[ "$(uname)" == "Linux" ]]; then
  info "Installing Linux packages"
  if source "$DOTFILES/scripts/dependencies-install-linux.sh"; then
    success "Linux packages installed"
    info "Setting Zsh as the default shell"
    chsh -s "$(command -v zsh)" || fail "Failed to set Zsh as default shell"
  else
    fail "Error installing Linux packages"
  fi
fi

info "Setting up SSH"
if [[ ! -f "$HOME/.ssh/id_rsa" ]]; then
  ssh-keygen -t rsa -b 4096 -C "$(git config --global user.email)" -f "$HOME/.ssh/id_rsa" -N "" || fail "SSH key generation failed"
  eval "$(ssh-agent -s)"
  success "SSH setup completed"
else
  success "SSH already set up"
fi

echo ''
success 'All installed!'
