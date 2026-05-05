#!/bin/bash
# Make the Directorys
mkdir -p ~/User/ElBastionDelOlvido
mkdir -p ~/User/Fixed/Configurations
mkdir -p ~/User/Fixed/Downloads
mkdir -p ~/User/Fixed/Pictures
mkdir -p ~/User/Fixed/Videos
mkdir -p ~/User/Fixed/Musics
# Copy the repository
git clone https://github.com/Zukunter/ElBastionDelOlvido/tree/Stable ~/User/ElBastionDelOlvido
# Install JetBrainsMono
mkdir -p ~/.local/share/fonts
mkdir ~/Temporal
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o ~/Temporal/JetBrainsMono.zip
unzip -o ~/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv

# Set Variables
#mv ~/.zshenv ~/.zshenv.bank
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/Env.sh -o ~/.zshenv
