#!/bin/bash

source ~/dotfiles/commands/utils.sh

cat <<-EOF
init-unix.sh:
  Starting initialization for unix system ...

$(cat ~/dotfiles/aa/text/init-unix-sh.txt)

EOF

ensure-file-existence ~/dotfiles/.bash_profile.local
ensure-directory-existence ~/.config
ensure-directory-existence ~/.zsh

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.inputrc ~/.inputrc
ln -sf ~/dotfiles/.agignore ~/.agignore

ln -sf ~/dotfiles/.vim/ ~/
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ranger ~/.config/
ln -sf ~/dotfiles/karabiner ~/.config/

ln -sf ~/dotfiles/.ctags.d/ ~/

cat <<-EOF

init-unix.sh:
  Completed initialization!

EOF
