# tree

if (( $+commands[tree] )) && (( $+commands[less] )); then
  function tre () {
    tree -aC -I '.git|node_modules|vendor' --dirsfirst "$@" | less -FRNX;
  }
fi

# make nvmrc

if (( $+commands[node] )); then
  function mknvmrc () {
    if [ -e .nvmrc ]; then
      echo "File '.nvmrc' already exists."
    else
      local node_version=$(node -v)

      if [ "$1" = "latest" ]; then
        node_version="node"
      elif [ "$1" = "lts" ]; then
        node_version="lts/*"
      elif [ "$1" != "" ]; then
        node_version="$1"
      fi

      echo $node_version > .nvmrc
      echo "File '.nvmrc' has been created. Version: $node_version"
    fi
  }
fi
