#!/bin/bash
# Make the Directorys
mkdir -p ~/.local/share/fonts
mkdir -p ~/Temporal

echo "Downloading Fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o ~/Temporal/JetBrainsMono.zip

unzip -o ~/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts

fc-cache -fv
mv ~/.zshenv ~/.zshenv.bank
curl -L https://github.com/Zukunter/ElBastionDelOlvido/SetEnv.zsh -o ~/.zshenv
