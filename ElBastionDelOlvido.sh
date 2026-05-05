#!/bin/bash
# Make the Directorys
mkdir -p ~/User/ElBastionDelOlvido
mkdir -p ~/User/Fixed/Configurations
mkdir -p ~/User/Fixed/Downloads
mkdir -p ~/User/Fixed/Pictures
mkdir -p ~/User/Fixed/Videos
mkdir -p ~/User/Fixed/Audios
mkdir -p ~/WorkSpace


Ghostty=~/User/Fixed/Configurations/ghostty
mkdir "$Ghostty"
touch "$Ghostty/config"
echo "config-file = ~/User/ElBastionDelOlvido/Ghostty.toml" > "$Ghostty/config"

Hyprland=~/User/Fixed/Configurations/hypr
mkdir "$Hyprland"
touch "$Hyprland/hyprland.conf"
echo "source = ~/User/ElBastionDelOlvido/Desktop/Hyprland/Start.conf" > "$Hyprland/hyprland.conf"
# Copy the repository
git clone https://github.com/Zukunter/ElBastionDelOlvido/Stable ~/User/ElBastionDelOlvido
# Install JetBrainsMono
mkdir -p ~/.local/share/fonts
mkdir ~/Temporal
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o ~/Temporal/JetBrainsMono.zip
unzip -o ~/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
# Set Variables
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/Env.sh -o ~/.zshenv
