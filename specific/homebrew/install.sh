#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! "$(command -v brew)"; then
    echo "  Installing Homebrew for you."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run Homebrew through the Brewfile
echo "› brew bundle"
sleep 2
brew bundle --file="specific/homebrew/Brewfile"
# double because just running it once doesn't work
sleep 2
brew bundle --file="specific/homebrew/Brewfile"
# For debugging
# brew bundle --verbose --file="specific/homebrew/Brewfile"
exit 0
