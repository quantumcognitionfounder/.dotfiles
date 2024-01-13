#!/bin/sh

install_path=/usr/share/nano-syntax-highlighting

# Install dependencies
sudo apt update && sudo apt install git btop zsh bat autojump command-not-found packagekit-command-not-found exa stow tmux tee
sudo git clone https://github.com/scopatz/nanorc.git $install_path
echo "include $install_path/*.nanorc" | sudo tee -a /etc/nanorc
echo "set mouse" | sudo tee -a /etc/nanorc
sudo sed -i '/brightnormal/d' $install_path/nanorc.nanorc
sudo update-command-not-found
sudo apt-file update
sudo chsh -s $(which zsh) $USER
curl -L git.io/antigen > ~/.antigen.zsh
stow zsh
