#!/bin/bash

if [[ "$(uname)" == "Linux" ]]; then
  set -e
  echo "› updating packages"
  sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
fi
