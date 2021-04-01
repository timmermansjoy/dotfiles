#!/bin/zsh

shellcheck -e SC1071,SC1090,SC2002 ./scripts/*.sh ./specific/**/*.sh ./basic/*/*.sh
