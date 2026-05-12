#!/bin/bash
sudo zypper ar -f https://download.opensuse.org/repositories/home:/ericfrs/openSUSE_Tumbleweed/ ericfrs
sudo zypper ref
# Install by zypper
sudo zypper in -y neovim lf git curl unzip zsh hyprland hyprshot hyprsunset \
    awww rust clang zig nasm wtype ydotool zen-browser firewalld \
    ghostty waybar mako fuzzel mpv docker steam btop fastfetch \
    eza flatpak fzf ripgrep make npm pamixer playerctl python315 zoxide bat \
    hyprpolkitagent gnome-disk-utility nautilus xdg-desktop-portal-hyprland bluetui \

# Install by cargo
cargo install starship --locked --force
cargo install sccache --locked --force
cargo install treesiter-cli --locked --force

# Install by flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak install -y flathub org.vinegarhq.Sober
flatpak install -y flathub com.spotify.Client

# Make the Directorys
mkdir -p $HOME/User/Fixed/Configurations
mkdir -p $HOME/User/Fixed/Downloads
mkdir -p $HOME/User/Fixed/Pictures
mkdir -p $HOME/User/Fixed/Videos
mkdir -p $HOME/User/Fixed/Audios

mkdir -p $HOME/User/Workspace/RustLib
mkdir -p $HOME/User/Workspace/Zig/ztd

# Copy repository
git clone -b Stable https://github.com/Zukunter/Nexus.git ~/User/Workspace/Nexus
git clone -b Stable https://github.com/Zukunter/ZtdRust.git ~/User/Workspace/RustLib/ztd
git clone -b Stable https://github.com/Zukunter/ZtdZig.git ~/User/Workspace/ZigLib/ztd
#git clone -b Stable https://github.com/Zukunter/HollowOuroboro.git ~/User/Workspace/HollowOuroBoro

git clone -b Stable https://github.com/Zukunter/ElBastionDelOlvido.git ~/User/ElBastionDelOlvido
#rm -r ~/User/ElBastionDelOlvido/Zsh/Plugins/antidote
git clone -b main 	https://github.com/mattmc3/antidote.git ~/User/ElBastionDelOlvido/Zsh/Plugins/antidote

Ghostty=$HOME/User/Fixed/Configurations/ghostty
mkdir "$Ghostty"
touch "$Ghostty/config"
echo "config-file = $HOME/User/ElBastionDelOlvido/Ghostty.toml" > "$Ghostty/config"

Hyprland=$HOME/User/Fixed/Configurations/hypr
mkdir "$Hyprland"
touch "$Hyprland/hyprland.conf"
echo "source = $HOME/User/ElBastionDelOlvido/Desktop/Hyprland/Start.conf" > "$Hyprland/hyprland.conf"

# Install JetBrainsMono
mkdir -p $HOME/.local/share/fonts
mkdir $HOME/Temporal
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o $HOME/Temporal/JetBrainsMono.zip
unzip -o $HOME/Temporal/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
rm -rf $HOME/Temporal

# Set Variables
curl -L https://raw.githubusercontent.com/Zukunter/ElBastionDelOlvido/Stable/Env.sh -o $HOME/.zshenv

sudo chattr -i /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf
echo "nameserver 9.9.9.9" | sudo tee -a /etc/resolv.conf
sudo chattr +i /etc/resolv.conf

#Command to set
sudo usermod -aG input $USER
sudo usermod -aG audio $USER
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo zypper install pipewire wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber
systemctl --user enable --now hyprpolkitagent.service
sudo systemctl enable --now firewalld
sudo firewall-cmd --zone=trusted --add-interface=docker0 --permanent
sudo chsh -s $(which zsh) $USER
chmod +x $HOME/User/ElBastionDelOlvido/**/*.sh
sudo timedatectl set-local-rtc 0
sudo zypper clean -a
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#export MAKEFLAGS="-j$(nproc)"

sudo zypper dup
systemctl reboot
