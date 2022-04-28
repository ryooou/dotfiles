#!/bin/sh

create_symlink() {
  local from=${1:?}
  local to=${2:?}
  local backup_dir=${3:?}

  if [ -d $to -o -f $to ]; then
    mkdir -p $backup_dir
    mv $to $backup_dir
  fi 

  ln -sfnv $from $to
}

create_symlink ${1:?} ${2:?} ${3:?}
