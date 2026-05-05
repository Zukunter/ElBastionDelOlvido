#!/bin/bash
sudo zypper in -y neovim lf git curl unzip zsh hyprland hyprshot hyprsunset awww rust clang zig nasm wtype ydotool \
    ghostty waybar mako fuzzel mpv docker steam btop fastfetch \
    eza flatpak fzf ripgrep make npm pamixer playerctl python315 zoxide \

cargo install starship --locked --force
cargo install treesiter-cli --locked --force
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub app.zen_browser.zen
flatpak install -y flathub org.vinegarhq.Sober
flatpak install -y flathub com.spotify.Client
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
#Command to set
sudo usermod -aG input $USER
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo chsh -s $(which zsh) $USER
chmod +x $HOME/User/ElBastionDelOlvido/**/*.sh
rm -rf $HOME/Temporal
sudo timedatectl set-local-rtc 0
sudo zypper clean -a
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
export MAKEFLAGS="-j$(nproc)"
cargo install sccache
