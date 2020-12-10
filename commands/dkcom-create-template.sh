#!/bin/bash

private_prefix=".eiji03aero.local."

dkcom-create-template() {
  arg_public="${1:-public}"

  directory="."
  template_directory="$HOME/dotfiles/templates"

  sh_file_name="docker-compose.sh"
  compose_file_name="docker-compose.yml"
  compose_sync_file_name="docker-compose-sync.yml"
  sync_file_name="docker-sync.yml"

  if [ $arg_public = "private" ]; then
    sh_file_name="$private_prefix$sh_file_name"
    compose_file_name="$private_prefix$compose_file_name"
    compose_sync_file_name="$private_prefix$compose_sync_file_name"
    sync_file_name="$private_prefix$sync_file_name"
  fi

  sh_file_path="${directory}/${sh_file_name}"
  compose_file_path="${directory}/${compose_file_name}"
  compose_sync_file_path="${directory}/${compose_sync_file_name}"
  sync_file_path="${directory}/${sync_file_name}"

  sh_template_path="${template_directory}/docker-compose.sh"
  compose_template_path="${template_directory}/docker-compose.yml"
  compose_sync_template_path="${template_directory}/docker-compose-sync.yml"
  sync_template_path="${template_directory}/docker-sync.yml"

  cat ${sh_template_path} > ${sh_file_path}
  cat ${compose_template_path} > ${compose_file_path}
  cat ${compose_sync_template_path} > ${compose_sync_file_path}
  cat ${sync_template_path} > ${sync_file_path}

  chmod +x ${sh_file_path}
}
