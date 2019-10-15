#!/bin/sh

# clone prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zsh <<- EOF
# generate files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# update prezto
# cd ~/.zprezto
# git pull && git submodule update --init --recursive

# add source on the files in dotfiles
echo "source ${HOME}/dotfiles/.zprofile" >> ${ZDOTDIR:-$HOME}/.zprofile
echo "source ${HOME}/dotfiles/.zshrc" >> ${ZDOTDIR:-$HOME}/.zshrc
EOF
