#!/bin/sh

if test ! $(which git); then
  echo "Git is not installed!"
  exit 1
fi

if [ ! -f ~/.gitconfig.local ] ;then
  touch ~/.gitconfig.local
fi

input_name=${1}
input_email=${2}

if [ -n "$input_name" ] ;then
  name="$input_name"
else
  echo "Please enter your name. : "
  read name
fi

if [ -n "$input_email" ] ;then
  email="$input_email"
else
  echo "Please enter your email address. : "
  read email
fi

git config --global user.name "$name"
git config --global user.email "$email"


#
# Templates installation for adding hooks to all repositories.
#
# https://github.com/awslabs/git-secrets#advanced-configuration
#

git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templateDir ~/.git-templates/git-secrets

