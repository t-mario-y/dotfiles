#!/bin/bash

set -eu

if type deno > /dev/null 2>&1; then
  echo 'deno is already installed.'
else
  curl -fsSL https://deno.land/install.sh | sh
fi

if type fzf > /dev/null 2>&1; then
  echo 'fzf is already installed.'
else
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
fi

if type asdf > /dev/null 2>&1; then
  echo 'asdf is already installed.'
else
  rm -rf ~/.asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
fi

# terminal helpers, not essential
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

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
