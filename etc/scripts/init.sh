#!/bin/sh

if [ ! "$(uname)" = 'Darwin' ]; then
  echo "Your platform ($(uname -a)) is not supported!"
  exit 1
fi

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if test ! $(which zsh); then
  echo "Zsh is not installed! Please install zsh first!"
  exit 1
fi
