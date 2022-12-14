#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  git \
  tree

# asdf
# TODO: 冪等ではないスクリプト。type asdf などを使って初回が失敗しても通るようにする
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

# GitHub cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
# TODO: apt-getではないので冪等ではない
sudo apt install gh

# aptで管理するtmuxが古いため、自前でビルドする。
sudo apt-get remove -y tmux
sudo apt-get install -y --no-install-recommends \
  bison \
  build-essential \
  libevent-dev \
  ncurses-dev \
  pkg-config

cd "$HOME"
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar xzf tmux-3.3a.tar.gz
cd tmux-3.3a
./configure --prefix="${ROOT_DIR}"/.local \
  CFLAGS="-I${ROOT_DIR}/.local/include -I${ROOT_DIR}/.local/include/ncurses" \
  LDFLAGS="-L${ROOT_DIR}/.local/include -L${ROOT_DIR}/.local/include/ncurses -L${ROOT_DIR}/.local/lib"
make
sudo make install
cd ..
rm tmux-3.3a.tar.gz
rm -rf tmux-3.3a
cd dotfiles

TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

# delta
asdf plugin add delta https://github.com/andweeb/asdf-delta.git
asdf install delta 0.13.0
asdf global delta 0.13.0

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# ghq
sudo apt-get install -y --no-install-recommends unzip
asdf plugin add ghq
asdf install ghq 1.3.0
asdf global ghq 1.3.0

# navi
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

# starship
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y --force

# Node.js
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts

# docker
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin

# dockerをsudoなしで実行するためのステップ。ChromeOS & Linuxの再起動が必要。
sudo usermod -aG docker "$(whoami)"

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz
