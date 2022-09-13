sudo apt update

sudo apt upgrade -y

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update
sudo apt-get install neovim -y

git clone https://github.com/TeddyRandby/nvim-config.git ~/.config/nvim
git clone https://github.com/TeddyRandby/tmux-config.git ~/.config/tmux

echo "export TERM=xterm-256colors" | ~/.profile
