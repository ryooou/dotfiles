#!/bin/sh

if [ ! "$(uname)" = 'Darwin' ]; then
  echo "Your platform ($(uname -a)) is not supported!"
  exit 1
fi

if test ! $(which zsh); then
  echo "Zsh is not installed! Please install zsh first!"
  exit 1
else
  chsh -s $(which zsh)
fi

if test ! $(which xcode-select); then
  xcode-select --install > /dev/null
fi

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

BREW_PREFIX=$(brew --prefix)

if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  brew install zsh
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

INSTALLED_GO=$(brew list | grep "go@[0-9\.]*")

if [ -n "$INSTALLED_GO" ] ;then
  brew uninstall $INSTALLED_GO
fi

if [ ! -f ${DOTPATH}/.zshrc.local ] ;then
  touch ${DOTPATH}/.zshrc.local
fi

if [ -n "$DOTPATH" ] && [ ! -f ${DOTPATH}/.gitconfig ] ;then
  cp ${DOTPATH}/gitconfig ${DOTPATH}/.gitconfig
fi

if [ ! -d ~/.nvm ] ;then
  mkdir -p ~/.nvm
fi

if [ ! -d ~/.terraform.d/plugin-cache ] ;then
  mkdir -p ~/.terraform.d/plugin-cache
fi
