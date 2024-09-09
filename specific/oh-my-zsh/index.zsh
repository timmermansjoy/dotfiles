export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(docker python git z brew virtualenv pyenv tmux)

source $ZSH/oh-my-zsh.sh

# Plugins that are in /shell/index but doesnt work propperly when put these there

# Link zsh plugin in MacOS
if [[ "$(uname)" == "Darwin" ]]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# Link zsh plugin in linux
if [[ "$(uname)" == "Linux" ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
