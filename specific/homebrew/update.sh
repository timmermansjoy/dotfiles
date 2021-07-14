#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
  echo "› brew update"
  brew update
  brew upgrade
fi
