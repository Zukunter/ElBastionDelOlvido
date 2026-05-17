#!/bin/bash

# miss install with error
#set -euo pipefail

# add eric's repo for zen-browser
sudo zypper ar -f https://download.opensuse.org/repositories/home:/ericfrs/openSUSE_Tumbleweed/ EricfrsRepo

# block files
sudo zypper rm -y 'yast2-*'
sudo zypper al 'yast2-*'

# refresh
sudo zypper ref

# install by zypper
sudo zypper in -y neovim lf git curl unzip zsh hyprland hyprshot hyprsunset \
    awww rustup clang zig nasm wtype ydotool zen-browser firewalld \
    pipewire pipewire-pulseaudio pipewire-alsa wireplumber libopenssl-devel pkg-config\
    ghostty waybar mako fuzzel mpv docker steam btop whatsapp-for-linux \
    eza flatpak fzf ripgrep make pamixer playerctl python315 zoxide bat \
    gnome-disk-utility nautilus xdg-desktop-portal-hyprland bluetui 

# set cargo
rustup default stable
# install by cargo
cargo install starship --locked --force
cargo install sccache --force
cargo install tree-sitter-cli --force

# install by flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y com.spotify.Client
# flatpak install -y flathub org.vinegarhq.Sober

# make the fixed directorys
mkdir -p $HOME/User/Fixed/Configurations
mkdir -p $HOME/User/Fixed/Downloads
mkdir -p $HOME/User/Fixed/Pictures
mkdir -p $HOME/User/Fixed/Videos
mkdir -p $HOME/User/Fixed/Audios

# make the workspace directorys
mkdir -p $HOME/User/Workspace/RustLib
mkdir -p $HOME/User/Workspace/ZigLib

# copy in workspace repositorys
git clone -b Stable https://github.com/Zukunter/Nexus.git ~/User/Workspace/Nexus
git clone -b Stable https://github.com/Zukunter/ZtdRust.git ~/User/Workspace/RustLib/ztd
git clone -b Stable https://github.com/Zukunter/ZtdZig.git ~/User/Workspace/ZigLib/ztd

# copy ElBastionDelOlvido repo
git clone -b Stable https://github.com/Zukunter/ElBastionDelOlvido.git ~/User/ElBastionDelOlvido
chmod +x $HOME/User/ElBastionDelOlvido/**/*.sh

# copy antidote repo so able to use it in zsh, delete it if exists
rm -r ~/User/ElBastionDelOlvido/Zsh/Plugins/antidote
git clone -b main 	https://github.com/mattmc3/antidote.git ~/User/ElBastionDelOlvido/Zsh/Plugins/antidote

# connect ghostty and hyprland so see ElBastionDelOlvido's conf
Ghostty=$HOME/User/Fixed/Configurations/ghostty
mkdir "$Ghostty"
touch "$Ghostty/config"
echo "config-file = $HOME/User/ElBastionDelOlvido/Ghostty.toml" > "$Ghostty/config"

Hyprland=$HOME/User/Fixed/Configurations/hypr
mkdir "$Hyprland"
touch "$Hyprland/hyprland.conf"
echo "source $HOME/User/ElBastionDelOlvido/Desktop/Hyprland/Start.conf" > "$Hyprland/hyprland.conf"

Lf=$HOME/User/Fixed/Configurations/lf
mkdir "$Lf"
touch "$Lf/lfrc"
echo "source $HOME/User/ElBastionDelOlvido/Lf/Start.zsh" > "$Lf/lfrc"

# make temporal dir
mkdir -p $HOME/.local/share/fonts

# install JetBrainsMono
mkdir $HOME/Temporal
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o $HOME/Temporal/JetBrainsMono.zip
unzip -o $HOME/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv

# remove temporal dir
rm -rf $HOME/Temporal

# set os's files

# set ZshEnv
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/ZshEnv.zsh -o $HOME/.zshenv

# set resolv
sudo chattr -i /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf
echo "nameserver 9.9.9.9" | sudo tee -a /etc/resolv.conf
sudo chattr +i /etc/resolv.conf

# set zypper
sudo chattr -i /etc/zypp/zypper.conf
sudo rm -rf /etc/zypp/zypper.conf
sudo curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/Zypper.toml -o /etc/zypp/zypper.conf

# set whatsapp 
mkdir $HOME/User/Fixed/Configurations/whatsapp-for-linux
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/Whatsapp.toml -o $HOME/User/Fixed/Configurations/whatsapp-for-linux/settings.conf

# set snapper confg
sudo chattr -i /etc/snapper/configs/root
sudo rm -rf /etc/snapper/configs/root
sudo curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/SnapperConf.toml -o /etc/snapper/configs/root

# set snapper service
sudo chattr -i /etc/systemd/system/snapper-cleanup.timer
sudo rm -rf /etc/systemd/system/snapper-cleanup.timer
sudo curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/SnapperService.toml -o /etc/systemd/system/snapper-cleanup.timer

# set docker
sudo chattr -i /etc/docker/daemon.json
sudo rm -rf /etc/docker/daemon.json
sudo curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/Docker.json -o /etc/docker/daemon.json

# set Rules
sudo curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/.OsFiles/Rules.js -o /etc/polkit-1/rules.d/10-Custom.rules

# add user
sudo usermod -aG input $USER
sudo usermod -aG audio $USER
sudo usermod -aG docker $USER
sudo usermod -aG video $USER
sudo usermod -aG wheel $USER


sudo chsh -s $(which zsh) $USER
sudo timedatectl set-local-rtc 0
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# services

# disable
sudo systemctl disable --now snapper-timeline.timer
sudo firewall-cmd --zone=trusted --add-interface=docker0 --permanent

# enable
sudo systemctl enable apparmor
sudo systemctl enable docker
sudo systemctl enable firewalld
sudo systemctl enable snapper-cleanup.timer
sudo systemctl enable pipewire.{service,socket}
sudo systemctl enable pipewire-pulse.{service,socket}
sudo systemctl enable wireplumber.service

# Update distro
# sudo zypper -y dup
# sudo zypper clean -a
echo "Bienvenido al El Bastion Del Olvido."
