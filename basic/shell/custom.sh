#!/bin/bash

########################################
# fzf - https://github.com/junegunn/fzf
########################################
if [[ -f ~/.fzf.zsh ]]; then
  # shellcheck disable=SC1090
  source ~/.fzf.zsh
fi
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias pxl="cd /Users/Joy/Stack/PXL/2e\ jaar/2e\ semester"
alias rm="rm -rf"
alias finder="open ."
# add support for ctrlf+o to open selected file in the default text editor
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

# TODO make completions work
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
