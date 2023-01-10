#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  git \
  lsb-release \
  tree

if type asdf > /dev/null 2>&1; then
  echo 'asdf is already installed.'
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
fi

if type gh > /dev/null 2>&1; then
  echo 'gh is already installed.'
else
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
fi
sudo apt install gh

if type tmux > /dev/null 2>&1 && [ "$(tmux -V)" = 'tmux 3.3a' ]; then
  echo 'tmux 3.3a is already installed.'
else
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
fi

if type delta > /dev/null 2>&1; then
  echo 'delta is already installed.'
else
  asdf plugin add delta https://github.com/andweeb/asdf-delta.git
  asdf install delta 0.13.0
  asdf global delta 0.13.0
fi

if type fzf > /dev/null 2>&1; then
  echo 'fzf is already installed.'
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
fi

if type ghq > /dev/null 2>&1; then
  echo 'ghq is already installed.'
else
  sudo apt-get install -y --no-install-recommends unzip
  asdf plugin add ghq https://github.com/t-mario-y/asdf-ghq
  asdf install ghq 1.3.0
  asdf global ghq 1.3.0
fi

if type navi > /dev/null 2>&1; then
  echo 'navi is already installed.'
else
  bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
fi

if type starship > /dev/null 2>&1; then
  echo 'starship is already installed.'
else
  sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y --force
fi

if type node > /dev/null 2>&1; then
  echo 'node is already installed.'
else
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs
  asdf install nodejs 18.12.0
  asdf global nodejs 18.12.0
fi

if type lazygit > /dev/null 2>&1; then
  echo 'lazygit is already installed.'
else
  asdf plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit
  asdf install lazygit 0.36.0
  asdf global lazygit 0.36.0
fi

if type yq > /dev/null 2>&1; then
  echo 'yq is already installed.'
else
  asdf plugin-add yq https://github.com/beardix/asdf-yq.git
  asdf install yq v4.30.6
  asdf global yq v4.30.6
fi

if type hadolint > /dev/null 2>&1; then
  echo 'hadolint is already installed.'
else
  asdf plugin add hadolint https://github.com/looztra/asdf-hadolint.git
  asdf install hadolint 2.9.3
  asdf global hadolint 2.9.3
fi

sudo apt-get install jq -y
sudo apt install bat
sudo apt install shellcheck

# print package versions managed by asdf
asdf latest --all
asdf current
