#!/bin/bash

set -eu

curl -fsSL https://deno.land/install.sh | sh

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

asdf plugin add ghq https://github.com/kajisha/asdf-ghq
asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
asdf plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit
asdf plugin-add yq https://github.com/beardix/asdf-yq

asdf install

# terminal helpers, not essential
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

curl -fsS  https://sh.rustup.rs | sh
cargo install --locked \
  bat \
  broot \
  fd-find \
  git-delta \
  ripgrep \
  taplo-cli \
  yazi-cli \
  yazi-fm \
  zoxide
