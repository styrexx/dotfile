#!/bin/sh

# alacritty zsh tmux nvim starship stow

clear
echo "##### We Download all the program that is not istalled. #####"

read -p "what is the pakage manager for your systeme: " PAKEGE

[ $(command -v alacritty) ] || echo "Downloading alacritty ..."
$PAKEGE install alacritty
[ $(command -v zsh) ] || echo "Downloading zsh ..."
$PAKEGE install zsh
[ $(command -v tmux) ] || echo "Downloading tmux ..."
$PAKEGE install tmux
[ $(command -v stow) ] || echo "Downloading stow ..."
$PAKEGE install stow

# installing nvim
LINKNVIM=https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
echo "Downloading nvim ..."
mkdir instt
cd instt
curl -LO $LINKNVIM
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.targz
cd ..
echo "Downloading nvim DONE"

# Installing starship
echo "Downloading starship ..."
curl -sS https://starship.rs/install.sh | sh

# Set your configs
echo "Seting your configs using gnu stow "
stow .

# Set zsh ase default shell
echo "Seting  zsh ase default shell... "
chsh -s $(which zsh)
