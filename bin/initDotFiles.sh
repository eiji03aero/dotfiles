#!/bin/bash

# Initialize dein package manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/dotfiles/.vim/dein

# ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
# ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
# ln -sf ~/dotfiles/.bashrc ~/.bashrc
# ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
# ln -sf ~/dotfiles/.inputrc ~/.inputrc
# 
# if [ ! -e "~/.vim" ]; then mkdir ~/.vim ; fi
# 
# for dirPath in `\find ~/dotfiles/.vim -maxdepth 1 -type d`; do
#   dirname=`basename ${dirPath}`
#   if [ ${dirname} != ".vim" ]; then
#     ln -sf ~/dotfiles/.vim/${dirname} ~/.vim/${dirname}
#   fi
# done
# 
# ln -sf ~/dotfiles/.vimrc ~/.vimrc
# ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
# 
# ln -sf ~/dotfiles/.ctags.d ~/.ctags.d
