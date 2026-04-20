#!/bin/bash
sudo zypper in git hyprland zsh hyprshot hyprsunset zig rust clang neovim waybar \ 
  fuzzel mako ydotool wtype flatpak lf curl
# Make the Directorys
mkdir -p ~/.local/share/fonts

mkdir -p ~/User/ElBastionDelOlvido
mkdir -p ~/User/Fixed/Configurations
mkdir -p ~/User/Fixed/Downloads
mkdir -p ~/User/Fixed/Pictures
mkdir -p ~/User/Fixed/Videos
mkdir -p ~/User/Fixed/Musics

mkdir -p ~/Temporal

echo "Downloading Fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o ~/Temporal/JetBrainsMono.zip

unzip -o ~/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts

fc-cache -fv
mv ~/.zshenv ~/.zshenv.bank
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/main/SetEnv.zsh -o ~/.zshenv

git clone https://github.com/Zukunter/ElBastionDelOlvido.git ~/Hola
