#!/bin/bash

if [ ! -e ~/dotfiles/.bash_profile.local ]; then
  touch ~/dotfiles/.bash_profile.local
fi

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.inputrc ~/.inputrc

ln -sf ~/dotfiles/.vim/ ~/
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -sf ~/dotfiles/.ctags.d/ ~/
