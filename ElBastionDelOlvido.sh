#!/bin/bash
# Make the Directorys
#mkdir -p $HOME/User/ElBastionDelOlvido
mkdir -p $HOME/User/Fixed/Configurations
mkdir -p $HOME/User/Fixed/Downloads
mkdir -p $HOME/User/Fixed/Pictures
mkdir -p $HOME/User/Fixed/Videos
mkdir -p $HOME/User/Fixed/Audios
mkdir -p $HOME/WorkSpace


Ghostty=$HOME/User/Fixed/Configurations/ghostty
mkdir "$Ghostty"
touch "$Ghostty/config"
echo "config-file = $HOME/User/ElBastionDelOlvido/Ghostty.toml" > "$Ghostty/config"

Hyprland=$HOME/User/Fixed/Configurations/hypr
mkdir "$Hyprland"
touch "$Hyprland/hyprland.conf"
echo "source = $HOME/User/ElBastionDelOlvido/Desktop/Hyprland/Start.conf" > "$Hyprland/hyprland.conf"
# Copy the repository
git clone -b Stable https://github.com/Zukunter/ElBastionDelOlvido.git ~/User/ElBastionDelOlvido
# Install JetBrainsMono
mkdir -p $HOME/.local/share/fonts
mkdir $HOME/Temporal
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o $HOME/Temporal/JetBrainsMono.zip
unzip -o $HOME/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
# Set Variables
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/Env.sh -o $HOME/.zshenv
