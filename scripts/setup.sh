
# -- Install dependencies --

# Pip
sudo apt-get install python3-pip
# Node and npm
sudo apt-get install nodejs
# Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# -- Install the latest nvim binary --
bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)

# -- Install lvim --
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
