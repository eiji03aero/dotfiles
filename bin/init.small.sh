#!/bin/bash

if [ ! -e ~/dotfiles/.bash_profile.local ]; then
  touch ~/dotfiles/.bash_profile.local
fi

cat <<-EOF > ~/.vimrc
$(cat ~/dotfiles/.vim/userautoload/init/basic.vim)
$(cat ~/dotfiles/.vim/userautoload/init/mapping.vim)
$(cat ~/dotfiles/.vim/colors/wombat.vim)
EOF

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
