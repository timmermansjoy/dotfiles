#!/usr/bin/env bash
set -euo pipefail

OS="$(uname -s)"

if [[ "$OS" != "Darwin" ]]; then
  echo "This script is intended for macOS (Darwin). Detected: $OS"
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Nothing to do."
  exit 1
fi

echo "› Updating Homebrew"
brew update

echo "› Upgrading formulae"
brew upgrade

echo "› Upgrading casks"
brew upgrade --cask || true

echo "› Cleaning up old versions and cache"
# Remove old versions and trim cache, keep only items used in the last 30 days
brew cleanup -s --prune=30

echo "› Autoremoving unused dependencies"
brew autoremove || true

echo "› Running brew doctor for basic health checks"
brew doctor || true

echo "› Removing broken symlinks inside Homebrew directories"
BREW_PREFIX="$(brew --prefix)"
BREW_CELLAR="$(brew --cellar)"

# Limit to Homebrew related paths
BROKEN_PATHS=(
  "$BREW_CELLAR"
  "$BREW_PREFIX/Caskroom"
  "$BREW_PREFIX/bin"
  "$BREW_PREFIX/sbin"
)

for p in "${BROKEN_PATHS[@]}"; do
  if [[ -d "$p" ]]; then
    echo "  Checking $p for broken symlinks"
    # Find symlinks whose targets do not exist
    find "$p" -type l ! -exec test -e {} \; -print -delete 2>/dev/null || true
  fi
done


echo "✅ All done"
