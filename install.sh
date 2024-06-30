#!/bin/sh

# alacritty zsh tmux nvim starship stow

clear
echo "##### We Download all the program that is not istalled. #####"

[ $(command -v alacritty) ] || echo "Downloading alacritty ..."
apt-get install alacritty
[ $(command -v zsh) ] || echo "Downloading zsh ..."
apt-get install zsh
[ $(command -v tmux) ] || echo "Downloading tmux ..."
apt-get install tmux
[ $(command -v stow) ] || echo "Downloading stow ..."
apt-get install stow

# installing nvim
LINKNVIM=https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
echo "Downloading nvim ..."
mkdir instt
cd instt
curl -LO $LINKNVIM
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.targz
echo "Downloading nvim DONE"

# Installing starship
echo "Downloading starship ..."
curl -sS https://starship.rs/install.sh | sh
