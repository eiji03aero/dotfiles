#!/bin/bash

dkc-stop () {
  name="${1:-}"
  docker container ls \
    | grep -v "CONTAINER ID" \
    | grep "$name" \
    | awk '{print $1}' \
    | xargs docker container stop
}

dkc-runner() {
  args='run --rm -it'

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
    args="${args} -v ${volume_option}"
  fi


  # ==================== image ====================
  selected_image=$(docker image ls \
    | tail +2 \
    | grep -v '<none>' \
    | awk '{print $1 ":" $2}' \
    | fzf --prompt "Select image: ")

  if [ -n "${selected_image}" ]; then
    args="${args} ${selected_image}"
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
    args="${args} ${command_option}"
  else
    echo 'error: command has to be given'
    return 1
  fi

  cat <<-EOF
Will run this command:
docker container $args

EOF

  eval "docker container $args"
}

dkcom-create-template() {
  private_prefix=".eiji03aero.local."

  arg_public="${1:-public}"

  directory="."
  template_directory="$HOME/dotfiles/templates/docker"

  sh_file_name="docker-compose.sh"
  compose_file_name="docker-compose.yml"
  compose_sync_file_name="docker-compose-sync.yml"
  sync_file_name="docker-sync.yml"
  file_prefix=""
  sync_volume_name="v-sync-$(cd $directory; pwd | xargs basename)"

  if [ $arg_public = "private" ]; then
    sh_file_name="$private_prefix$sh_file_name"
    compose_file_name="$private_prefix$compose_file_name"
    compose_sync_file_name="$private_prefix$compose_sync_file_name"
    sync_file_name="$private_prefix$sync_file_name"
    file_prefix=".eiji03aero.local."
  fi

  sh_file_path="${directory}/${sh_file_name}"
  compose_file_path="${directory}/${compose_file_name}"
  compose_sync_file_path="${directory}/${compose_sync_file_name}"
  sync_file_path="${directory}/${sync_file_name}"

  sh_template_path="${template_directory}/docker-compose.sh"
  compose_template_path="${template_directory}/docker-compose.yml"
  compose_sync_template_path="${template_directory}/docker-compose-sync.yml"
  sync_template_path="${template_directory}/docker-sync.yml"

  cat ${sh_template_path} \
    | sed "s/{{file_prefix}}/${file_prefix}/g" \
    > ${sh_file_path}

  cat ${compose_template_path} \
    > ${compose_file_path}

  cat ${compose_sync_template_path} \
    | sed "s/{{sync_volume_name}}/${sync_volume_name}/g" \
    > ${compose_sync_file_path}

  cat ${sync_template_path} \
    | sed "s/{{sync_volume_name}}/${sync_volume_name}/g" \
    > ${sync_file_path}

  chmod +x ${sh_file_path}
}
