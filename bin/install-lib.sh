#!/bin/bash

cmd="${1}"

install-ranger () {
  pip3 install ranger-fm
}

install-xquartz () {
  brew update
  brew cask install xquartz
  sudo launchctl load -w /Library/LaunchAgents/org.macosforge.xquartz.startx.plist
}

if [ $cmd = "ranger" ]; then
  install-ranger

elif [ $cmd = "xquartz" ]; then
  install-xquartz

fi
