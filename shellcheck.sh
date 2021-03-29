#!/bin/zsh

shellcheck -e SC1071 SC1090 ./scripts/*.sh ./specific/**/*.sh ./basic/*/*.sh
