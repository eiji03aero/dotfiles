#!/bin/bash

cmd="${1:-all}"

install-brew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install-git () {
  brew install git
}

install-tmux () {
  brew install tmux
  brew install tmuxinator
}

install-fzf () {
  brew install fzf
}

install-ranger () {
  pip3 install ranger-fm
}

install-universal-ctags () {
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
}

install-xquartz () {
  brew cask install xquartz
  sudo launchctl load -w /Library/LaunchAgents/org.macosforge.xquartz.startx.plist
}

if [ $cmd = "all" ]; then
  "in"
  install-brew

  install-git
  install-tmux
  install-fzf
  install-ranger
  install-universal-ctags
  install-xquartz
fi
