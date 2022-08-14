#!/bin/bash

set -eu

sudo apt-get update
apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  zsh \
  # for VSCode settings sync
  gnome-keyring \
  seahorse

# VSCode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-geet install code

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

sudo chsh -s /usr/bin/zsh "$(whoami)"

# TODO: alt + up/down is jacked to pageup/pagedown
# TODO: alt + shift + I is jacked to "send feedback to google"
sudo apt-get install dconf-tools
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['disabled']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['disabled']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['disabled']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['disabled']"

# TODO: 日本語入力 not working
sudo apt-get install -y --install-recommends \
  fcitx \
  fcitx-mozc \
  fonts-ipafont \
  fonts-ipaexfont

sudo apt install task-japanese locales-all fonts-ipafont -y
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
source /etc/default/locale
sudo touch /etc/

# code /etc/environment.d/fcitx.conf
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
# GDK_BACKEND=x11

# launch fcitx by "fcitx-configtool"
