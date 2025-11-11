######################################
# Ensure Shell Compatibility
######################################
if [[ -z "$ZSH_VERSION" ]]; then
  echo "Error: This configuration is intended for zsh."
  return 1
fi

######################################
# Validate DOTFILES Variable
######################################
if [[ -z "$DOTFILES" ]]; then
  echo "Error: DOTFILES variable is not set."
  return 1
fi

######################################
# Config
######################################
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Load functions
fpath=($DOTFILES/basic/functions $fpath)
for file in $DOTFILES/basic/functions/*; do
  [ -r "$file" ] && source "$file"
done

# Initialize completion system
autoload -Uz compinit
compinit -u

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE NO_HUP NO_LIST_BEEP LOCAL_OPTIONS LOCAL_TRAPS
setopt HIST_VERIFY SHARE_HISTORY EXTENDED_HISTORY PROMPT_SUBST
setopt CORRECT COMPLETE_IN_WORD IGNORE_EOF APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

######################################
# Window
######################################
function title() {
  local input="${1:-Untitled}"
  local escaped_input="${input//\%/\%\%}"
  local truncated=$(print -Pn "%40>...>$escaped_input" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$truncated:$3\e\\"
    ;;
  xterm* | rxvt)
    print -Pn "\e]2;$truncated\a"
    ;;
  *) ;;
  esac
}

######################################
# Completion
######################################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' verbose yes

######################################
# Customizations
######################################
source $DOTFILES/basic/shell/custom.sh
chpwd() ls -F
