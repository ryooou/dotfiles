#!/bin/bash

# Variables
from=${1:?}
to=${2:?}
backup_dir=${3:?}

# Main
if [ -d $to ] || [ -f $to ]; then
  mkdir -p $backup_dir
  mv $to $backup_dir
fi 

ln -sfnv $from $to
