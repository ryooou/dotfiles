#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# History file and its size
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000000

# DOTPATH
# export DOTPATH=${$0:A:h}
export DOTPATH=${HOME}/dotfiles
