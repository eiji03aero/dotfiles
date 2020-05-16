#!/bin/bash

cmd="${1}"

if [ $cmd = "ranger" ]; then
  pip3 install ranger-fm

elif [ $cmd = "xquartz" ]; then
  brew update
  brew cask install xquartz
  sudo launchctl load -w /Library/LaunchAgents/org.macosforge.xquartz.startx.plist

elif [ $cmd = "ctags" ]; then
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags

elif [ $cmd = "tmux" ]; then
  brew install tmux
  brew install tmuxinator

elif [ $cmd = "fzf" ]; then
  brew install fzf
fi
