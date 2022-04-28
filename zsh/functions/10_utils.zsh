# tree

if (( $+commands[tree] )) && (( $+commands[less] )); then
  function tre () {
    tree -aC -I '.git|node_modules|bower_components|vendor' --dirsfirst "$@" | less -FRNX;
  }
fi
