if (( $+commands[tree] )) && (( $+commands[less] )); then
  #
  # tree
  #
  function less_tree () {
    tree -aC -I '.git|node_modules|vendor' --dirsfirst "$@" | less -FRNX;
  }
  alias tre='less_tree'
fi

if (( $+commands[peco] )) && (( $+commands[git] )); then
  #
  # git diff
  #
  function peco_git_diff () {
    selected_file="$(git ls-files -m | peco)"
    if [ -z $selected_file ]; then
      echo "Invalid selected file."
      return 1
    else
      echo "$selected_file" | pbcopy
    fi
    git diff $selected_file
  }
  alias gdif='peco_git_diff'

  #
  # git branch
  #
  function pbcopy_git_branch () {
    local branch_name=$(git branch | peco)
    echo ${branch_name##** } | pbcopy
  }
  alias cpb='pbcopy_git_branch'
fi

if (( $+commands[terraform] )); then
  #
  # tf validation
  #
  function tf_validation () {
    find . -type f -name '*.tf' -exec dirname {} \; | sort -u | xargs -I {} terraform validate {}
  }
  alias tfvali='tf_validation'
fi

if (( $+commands[node] )); then
  #
  # nvmrc file
  #
  function make_nvmrc_file () {
    if [ -e .nvmrc ]; then
      echo "File '.nvmrc' already exists."
    else
      local node_version=$(node -v)

      if [ "$1" = "latest" ]; then
        node_version="node"
      elif [ "$1" = "lts" ]; then
        node_version="lts/*"
      elif [ -n "$1" ]; then
        node_version="$1"
      fi

      echo $node_version > .nvmrc
      echo "File '.nvmrc' has been created. Version: $node_version"
    fi
  }
  alias mknvm='make_nvmrc_file'
fi
