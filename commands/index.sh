#!/bin/zsh

source ~/dotfiles/commands/utils.sh
source ~/dotfiles/commands/git.sh
source ~/dotfiles/commands/docker.sh
source ~/dotfiles/commands/bridge.sh

ct () { ctags -R ; }

count-files () { find . | wc -l; }

poll-file-count () {
  threshold=${1}
  while $([ $(count-files) -lt $1 ]); do echo mada desu $(count-files); sleep 2s; done; echo owarimashita
}

fmt-concat-bars () {
  echo "$@" | sed -e "s/[.*;:'\"\`]//g" -e "s/[][(), ]/-/g";
}

# -------------------- vim --------------------
vim-perf-cursor () {
  file=${1}
  vim +'call ProfileCursorMove()' $file
}

# -------------------- tmux --------------------
tmes () {
  tmux new-session \; \
    split-window -h -l 45 \; \
    select-pane -L \; \
    send-keys 'vim' Enter
}

# -------------------- templates --------------------
create-template-cpp () {
  cp -r ~/dotfiles/templates/cpp/* ./
}

# -------------------- ngrok --------------------
ngrok-init () {
  if [ $# -ne 2 ]; then
    cat <<- EOF
    ngrok_init: error

    You need to pass exactly two arguments
      - 1: port you want to redirect to
      - 2: port you want to use to inspect ngrok. incremental number
EOF
    return 1;
  fi

  port=${1}
  ngrok_port=${2}
  api_url="http://localhost:${ngrok_port}/api/tunnels"

  ngrok http $port -log=stdout > /dev/null &

  # need to wait a little bit before acquire url
  sleep 3s

  # return ngrok address to stdout
  echo $(curl -s $api_url \
    | grep -oE 'http://.{8}.ngrok.io')
  return 0;
}

remove_duplicate_export_path () {
  _path=""
  for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
      *:"${_p}":* )
        ;;
      * )
        if [ "$_path" ]; then
          _path="$_path:$_p"
        else
          _path=$_p
        fi
        ;;
    esac
  done
  PATH=$_path

  unset _p
  unset _path
}
