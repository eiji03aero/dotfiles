#!/bin/bash

source_dir="$HOME/dotfiles/vscode"
vscode_settings_dir="$HOME/Library/Application Support/Code/User"

files=$(cat << EOF
settings.json
keybindings.json
EOF
)

extensions=$(cat "$source_dir/extensions.txt")

for file in $files; do
  src_file="$source_dir/$file"
  dest_file="$vscode_settings_dir/$file"

  if [ -e "$dest_file" ]; then
    rm "$dest_file"
  fi

  ln -s "$src_file" "$dest_file"
done

for extension in $extensions; do
  code --install-extension $extension
done
