#!/bin/bash

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

if [[ "$(uname)" == "Darwin" ]]; then
  softwareupdate -i -a

  # shellcheck disable=SC1090
  source ~/.dotfiles/specific/macos/set-defaults.sh
fi
