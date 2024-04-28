#!/bin/bash

set -eu

sudo apt-get upgrade && sudo apt-get install -y --no-install-recommends \
  jq \
  tree 
sudo apt-get autoremove -y
sudo apt upgrade && sudo apt install -y \
  bat \
  shellcheck

if type gh > /dev/null 2>&1; then
  echo 'gh is already installed.'
else
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
fi
sudo apt install gh

if type tmux > /dev/null 2>&1 && [ "$(tmux -V)" = 'tmux 3.4' ]; then
  echo 'tmux 3.4 is already installed.'
else
  sudo apt-get remove -y tmux
  sudo apt-get install -y --no-install-recommends \
    bison \
    build-essential \
    libevent-dev \
    ncurses-dev \
    pkg-config

  cd "$HOME"
  curl -sLO https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz
  tar xzf tmux-3.4.tar.gz
  cd tmux-3.4
  ./configure --enable-sixel --prefix="$HOME"/.local \
    CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" \
    LDFLAGS="-L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib"
  make
  sudo make install
  cd ..
  rm tmux-3.4.tar.gz
  rm -rf tmux-3.4
  cd dotfiles

  TPM_PATH=~/.tmux/plugins/tpm
  if [ ! -e $TPM_PATH ]; then
    git clone https://github.com/tmux-plugins/tpm $TPM_PATH
  fi
fi
