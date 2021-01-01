#!/bin/bash

# Install Oh My ZSH
echo "[ZSH Installer] Installing 'Oh My ZSH'..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set Shell to ZSH
chsh -s $(which zsh)

# Symlink Custom Dirs
ln -s ~/.dotfiles/ZSH/Plugins ~/.oh-my-zsh/custom && mv ~/.oh-my-zsh/custom/Plugins ~/.oh-my-zsh/custom/plugins
ln -s ~/.dotfiles/ZSH/Themes ~/.oh-my-zsh/custom && mv ~/.oh-my-zsh/custom/Themes ~/.oh-my-zsh/custom/themes

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