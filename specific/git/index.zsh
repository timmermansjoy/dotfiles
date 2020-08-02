function git_dig {
  git log --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%Creset - %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=short -G"$1" -- $2
}


# use `hub` as our git wrapper
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# custom aliases
alias gs='gst'
# for all the rest, I just use oh-my-zsh git plugin aliases
