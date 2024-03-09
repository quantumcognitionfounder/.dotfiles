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

# Pyenv autoinstaller
curl https://pyenv.run | bash

# Add pyenv to zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# Install pyenv-virtualenv as pyenv plugin
$ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# Add pyenv-virtualenv to zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

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