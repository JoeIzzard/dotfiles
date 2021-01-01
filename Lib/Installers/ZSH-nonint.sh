#!/bin/bash

#Info Message
echo "[ZSH Installer] Installation Bagan..."

# Determin OS
unameOut=$(uname -s)

case "${unameOut}" in
    Linux*) machine=Linux;;
    Darwin*)    machine=Mac;;
esac
echo "[ZSH Installer] OS Determined: ${machine}"

# Install ZSH
if [ "${machine}" = "Mac" ]
then
    brew install zsh
elif [ "${machine}" = "Linux" ]
then
    apt-get install zsh
else
    echo "[ZSH Installer] OS Not Supported"
fi

# Install Oh My ZSH
echo "[ZSH Installer] Installing 'Oh My ZSH'..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlink Custom Dirs
ln -s ~/.dotfiles/ZSH/Plugins ~/.oh-my-zsh/custom/plugins
ln -s ~/.dotfiles/ZSH/Themes ~/.oh-my-zsh/custom/themes

if [ -f ~/.dotfiles/ZSH/Configs/Base ]
then
    echo "[ZSH Installer] Removing existing configuration file..."
    rm -f ~/.zshrc
    
    echo "[ZSH Installer] Linking configuration file Base"
    ln -s ~/.dotfiles/ZSH/Configs/Base ~/.zshrc
else
    echo "[ZSH Installer] Choosen File not available..."
fi

echo "[ZSH Installer] Installation Complete"