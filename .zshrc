#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


# Custom functions
for function in ${DOTPATH:?}/zsh/functions/*; do
  source $function:a
done

# Local config
[[ -f ${ZDOTDIR:-$HOME}/.zshrc.local ]] && source ${ZDOTDIR:-$HOME}/.zshrc.local
