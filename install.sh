sudo apt update

sudo apt upgrade -y

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

git clone https://github.com/TeddyRandby/nvim-config.git ~/.config/nvim
