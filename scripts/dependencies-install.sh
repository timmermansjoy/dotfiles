#!/bin/bash
TYPE="${1:-install}"
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
cd "$(dirname "$0")"/.. || exit
find -H "$DOTFILES" -maxdepth 4 -name "${TYPE}.sh" -not -path '*.git*' -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;
