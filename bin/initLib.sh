# for add-apt-repository http://d.hatena.ne.jp/Kazuhira/20160116/1452933387
sudo apt-get install apt-file
sudo apt-file update
sudo apt-file search add-apt-repository
sudo apt-get install software-properties-common

# Install the latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# For tmux https://qiita.com/koara-local/items/7e8391b837fb6f834cb9
sudo apt-get install automake
sudo apt-get install libevent-dev libncurses5-dev
sudo apt-get install xsel
# #!/bin/bash -xeu
# 
# if [ ! -d tmux ]; then
#     git clone https://github.com/tmux/tmux.git
# fi
# 
# cd tmux
# 
# # checkout latest tag
# git checkout $(git tag | sort -V | tail -n 1)
# 
# sh autogen.sh
# 
# ./configure
# 
# make -j4
# 
# sudo make install

# Install tmux
sudo apt install tmux
