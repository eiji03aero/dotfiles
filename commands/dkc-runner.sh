#!/bin/bash

dkc-runner() {
  COMMAND='docker container run --rm'

  # ==================== volume ====================
  volume_option=''
  volume_option_choice=''
  echo "Select volume mount type"
  select volume_option_choice in 'local/node' 'custom' 'none'; do
    if [ "$volume_option_choice" = 'local/node' ]; then
      volume_option='$(pwd):/projects'
    elif [ "$volume_option_choice" = 'custom' ]; then
      read -p 'Input volume (eg. $(pwd):/projects): ' volume_option
    fi
    break
  done

  if [ "${volume_option}" != '' ]; then
    COMMAND="${COMMAND} -v ${volume_option}"
  fi


  # ==================== image ====================
  selected_image=$(docker image ls \
    | tail +2 \
    | grep -v '<none>' \
    | awk '{print $1 ":" $2}' \
    | fzf --prompt "Select image: ")

  COMMAND="${COMMAND} -t ${selected_image}"


  # ==================== command ====================
  command_option=''
  command_option_choice=''
  echo "Select command type"
  select command_option_choice in '/bin/bash' 'custom'; do
    if [ "$command_option_choice" = '/bin/bash' ]; then
      command_option='/bin/bash'
    elif [ "$command_option_choice" = 'custom' ]; then
      read -p 'Input volume (eg. /bin/bash): ' command_option
    fi
    break
  done

  if [ "${command_option}" != '' ]; then
    COMMAND="${COMMAND} ${command_option}"
  fi

  echo $COMMAND
}
