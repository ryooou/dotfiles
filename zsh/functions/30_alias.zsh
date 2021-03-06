# zsh
alias ..='cd ..'
alias cp='cp -v'
alias mv='mv -v'
alias la='ls -aF'
alias ll='ls -l'
alias lla='ls -alF'
alias rm='rm -iv'

# terraform
if (( $+commands[terraform] )); then
  alias tf='terraform'
  alias tfp='terraform plan'
fi
