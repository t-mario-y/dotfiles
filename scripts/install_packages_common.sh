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
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
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

if type delta > /dev/null 2>&1; then
  echo 'delta is already installed.'
else
  asdf plugin add delta https://github.com/andweeb/asdf-delta.git
  asdf install delta 0.15.1
  asdf global delta 0.15.1
fi

if type ghq > /dev/null 2>&1; then
  echo 'ghq is already installed.'
else
  asdf plugin add ghq https://github.com/t-mario-y/asdf-ghq
  asdf install ghq 1.3.0
  asdf global ghq 1.3.0
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

npm install -g tldr
