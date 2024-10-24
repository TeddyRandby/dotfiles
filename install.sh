#!/bin/bash
# Install neovim
curl -Lo nvim.tgz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

tar xf nvim.tgz

sudo cp -r nvim-linux64/bin/* /usr/local/bin/
sudo cp -r nvim-linux64/lib/* /usr/local/lib/
sudo cp -r nvim-linux64/share/* /usr/local/share/

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz lazygit

sudo install lazygit /usr/local/bin

# Clone neovim and tmux configs
git clone --recursive https://github.com/TeddyRandby/tmux-config.git ~/.config/tmux
git clone https://github.com/TeddyRandby/nvim-config.git ~/.config/nvim

echo "echo \"\$OPENAPI_KEY\"" >> ~/.config/openapikey.sh
sudo chmod +x ~/.config/openapikey.sh

echo "export TERM=xterm-256color" >> ~/.profile
