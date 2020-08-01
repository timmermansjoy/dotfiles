#!/bin/bash

########################################
# fzf - https://github.com/junegunn/fzf
########################################
if [[ -f ~/.fzf.zsh ]]; then
  # shellcheck disable=SC1090
  source ~/.fzf.zsh
fi
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in the default text editor
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

# TODO make completions work
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
