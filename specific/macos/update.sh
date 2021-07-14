#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
  echo "› MacOS update"
  # shellcheck disable=SC1090
  source "${BASH_SOURCE%/*}"/install.sh
fi
