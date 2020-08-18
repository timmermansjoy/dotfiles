# Get weather report
function weather {
   curl -s "http://wttr.in/${1:-Hasselt}" | head -n 27
}
alias weer="weather"

# Get wifi password of given SSID
function wifi_password {
  wifi_name=$1
  security find-generic-password -ga $wifi_name | grep “password:”
}

#ease of use aliases
alias lhost="open http://localhost:8080"
alias localh="open http://localhost:8080"
alias dotfile='e ~/.dotfiles'
alias dotfiles='e ~/.dotfiles'
alias cpu="htop"

# Programs shortcuts
alias s="osascript -e 'tell application \"Safari\" to activate'"
alias disc="osascript -e 'tell application \"Discord\" to activate'"

