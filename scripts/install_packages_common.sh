#!/bin/bash

set -eu

if type fzf > /dev/null 2>&1; then
  echo 'fzf is already installed.'
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
fi

if type asdf > /dev/null 2>&1; then
  echo 'asdf is already installed.'
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
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

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs
asdf plugin add delta https://github.com/andweeb/asdf-delta
asdf plugin add ghq https://github.com/kajisha/asdf-ghq
asdf plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit
asdf plugin-add yq https://github.com/beardix/asdf-yq
asdf plugin add hadolint https://github.com/looztra/asdf-hadolint

asdf install

npm install -g tldr
