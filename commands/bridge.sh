#!/bin/zsh

bridge-is-zsh () {
  if [ $(echo "$ZSH_EVAL_CONTEXT" | grep -e 'toplevel') ]; then
    return 0
  else
    return 1
  fi
}

bridge-read () {
  prompt_str="$1"
  var_str="$2"

  if bridge-is-zsh; then
    read $var_str\?$prompt_str
  else
    read -p $prompt_str $var_str
  fi
}
