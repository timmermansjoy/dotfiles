#!/bin/zsh

shellcheck --exclude [SC1071,SC1090] ./scripts/*.sh ./specific/**/*.sh ./basic/*/*.sh
