sudo apt update

sudo apt upgrade -y

curl -Lo nvim.tgz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

tar xvzf nvim.tgz

sudo cp -r nvim-linux64/bin/* /usr/local/bin/
sudo cp -r nvim-linux64/lib/* /usr/local/lib/
sudo cp -r nvim-linux64/share/* /usr/local/share/

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz -C /usr/local/bin lazygit

git clone https://github.com/TeddyRandby/nvim-config.git ~/.config/nvim

git clone https://github.com/TeddyRandby/tmux-config.git ~/.config/tmux

ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf

echo "export TERM=xterm-256color" >> ~/.profile

echo "alias e=\"nnn -e\"" >> ~/.profile
