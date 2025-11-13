#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
  exit 0
fi

echo "› Checking for macOS updates"
updates_output=$(softwareupdate -l 2>&1 || true)

if echo "$updates_output" | grep -q "No new software available."; then
  echo "No macOS updates available"
  exit 0
fi

echo "Available macOS updates:"
echo "$updates_output"
echo

read -r -p "Install these macOS updates now by running install.sh? [y/N] " answer
case "$answer" in
  [yY]|[yY][eE][sS])
    echo "› Running macOS update"
    # shellcheck disable=SC1090
    source "${BASH_SOURCE%/*}"/install.sh
    ;;
  *)
    echo "Skipping macOS update"
    ;;
esac
