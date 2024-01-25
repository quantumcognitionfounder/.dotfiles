#!/bin/sh

install_path=/usr/share/nano-syntax-highlighting

# Install dependencies
sudo apt update && sudo apt install git btop zsh bat autojump \
    command-not-found packagekit-command-not-found exa stow tmux \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl -y

# Setup nano syntax highlighting
sudo git clone https://github.com/scopatz/nanorc.git $install_path
sudo sh -c "echo \"include $install_path/*.nanorc\" >> /etc/nanorc"
sudo sed -i '/brightnormal/d' $install_path/nanorc.nanorc

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

export PYENV_ROOT="$HOME/.pyenv"

# Install pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# Update dbs
sudo update-command-not-found
sudo apt-file update

# Change default shell
sudo sh -c "chsh -s $(which zsh) $USER"

# Install antigen
curl -L git.io/antigen > ~/.antigen.zsh

# Run stow
stow zsh