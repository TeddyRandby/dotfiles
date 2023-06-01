#!/bin/bash

sudo apt update

sudo apt upgrade -y

./install_nvim.sh

./install_lg.sh

git clone https://github.com/TeddyRandby/tmux-config.git ~/.config/tmux

git clone https://github.com/TeddyRandby/nvim-config.git ~/.config/nvim

echo "export TERM=xterm-256color" >> ~/.profile
