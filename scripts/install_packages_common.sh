#!/bin/bash

set -eu

if type deno > /dev/null 2>&1; then
  echo 'deno is already installed.'
else
  curl -fsSL https://deno.land/install.sh | sh
fi

if type mise > /dev/null 2>&1; then
  echo 'mise is already installed.'
else
  curl https://mise.run | sh
fi

if type starship > /dev/null 2>&1; then
  echo 'starship is already installed.'
else
  sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y --force
fi

curl -fsS  https://sh.rustup.rs | sh
~/.cargo/bin/cargo install --locked \
  bat \
  fd-find \
  git-delta \
  navi
  # some tools are install heavy for tiny devices
  # broot \
  # ripgrep \
  # taplo-cli \
  # yazi-cli \
  # yazi-fm \
  # zoxide
