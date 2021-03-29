export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(docker git z brew osx docker-machine virtualenv)

source $ZSH/oh-my-zsh.sh

#installed plugins in zshrc, dont know why i cant put them there but gives issues with syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
