#!/bin/bash

# Custom functions

function top_commands {
  cat ~/.zsh_history | format_history | head -n20
}

alias tc=top_commands

function top_recent_commands {
  tail -n1000 ~/.zsh_history | format_history | head -n20
}
alias trc=top_recent_commands

function format_history {
  cut -d ';' -f 2- 2>/dev/null |
    awk '{a[$1]++ } END{for(i in a){print a[i] " " i}}' |
    sort -rn
}

# Get weather report
function weather {
  curl -s "http://wttr.in/${1:-Hasselt}" | head -n 27
}
alias weer="weather"

# Get wifi password of given SSID
function wifi_password {
  wifi_name=$1
  security find-generic-password -ga "$wifi_name" | grep "password:"
}

#remap defaults
alias rm="rm -rf"
alias cp="cp -i"

#ease of use aliases
alias lhost="open http://localhost:8080"
alias localh="open http://localhost:8080"
alias dotfile='e ~/.dotfiles'
alias dotfiles='e ~/.dotfiles'
alias myip="curl http://ipecho.net/plain; echo"
alias finder="open ."

# Programs shortcuts
alias s="osascript -e 'tell application \"Safari\" to activate'"
alias disc="osascript -e 'tell application \"Discord\" to activate'"
