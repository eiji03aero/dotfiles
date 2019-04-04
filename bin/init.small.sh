#!/bin/bash

if [ ! -e ~/dotfiles/.bash_profile.local ]; then
  touch ~/dotfiles/.bash_profile.local
fi

cat <<EOF > ~/.vimrc
$(cat ~/dotfiles/.vim/userautoload/init/basic.vim)
$(cat ~/dotfiles/.vim/userautoload/init/color.vim)
$(cat ~/dotfiles/.vim/userautoload/init/mapping.vim)
EOF

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
