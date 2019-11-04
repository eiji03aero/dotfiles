#!/bin/bash

dkc-runner() {
  ARGS='run --rm -it'

  # ==================== volume ====================
  volume_option=''
  volume_option_choice=''
  echo "Select volume mount type"
  select volume_option_choice in '$(pwd):[custom]' 'custom' 'none'; do
    if [ "$volume_option_choice" = '$(pwd):[custom]' ]; then
      bridge-read 'Input mount path (eg. $(pwd):[this part]): ' mount_path
      volume_option="$(pwd):${mount_path}"
    elif [ "$volume_option_choice" = 'custom' ]; then
      bridge-read 'Input volume (eg. $(pwd):/projects): ' volume_option
    fi
    break
  done

  if [ -n "${volume_option}" ]; then
    ARGS="${ARGS} -v ${volume_option}"
  fi


  # ==================== image ====================
  selected_image=$(docker image ls \
    | tail +2 \
    | grep -v '<none>' \
    | awk '{print $1 ":" $2}' \
    | fzf --prompt "Select image: ")

  if [ -n "${selected_image}" ]; then
    ARGS="${ARGS} ${selected_image}"
  else
    echo 'error: image has to be chosen'
    return 1
  fi


  # ==================== command ====================
  command_option=''
  command_option_choice=''
  echo "Select command type"
  select command_option_choice in '/bin/bash' 'custom'; do
    if [ "$command_option_choice" = '/bin/bash' ]; then
      command_option='/bin/bash'
    elif [ "$command_option_choice" = 'custom' ]; then
      bridge-read 'Input volume (eg. /bin/bash): ' command_option
    fi
    break
  done

  if [ -n "${command_option}" ]; then
    ARGS="${ARGS} ${command_option}"
  else
    echo 'error: command has to be given'
    return 1
  fi

  cat <<-EOF
Will run this command:
docker container $ARGS

EOF

  eval "docker container $ARGS"
}
