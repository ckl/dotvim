#!/bin/bash

sudo apt-get update
sudo apt-get install --assume-yes vim

alias vi='vim'

mkdir -p .vim/colors

curl https://raw.githubusercontent.com/ckl/dotvim/master/vimrc_no_plugins > ~/.vimrc
curl https://raw.githubusercontent.com/ckl/dotvim/master/colors/zenburn.vim > ~/.vim/colors/zenburn.vim

#################
# Optional
#################

#apt-get install tmux
#curl https://raw.githubusercontent.com/ckl/tmuxconf/master/.tmux.conf > ~/.tmux.conf


