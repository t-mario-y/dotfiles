#!/bin/bash

set -eu

sudo apt-get update
apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  zsh \
  fcitx-config-gtk \
  fcitx-mozc \
  fonts-ipafont \
  fonts-ipaexfont

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

sudo chsh -s /usr/bin/zsh "$(whoami)"
