#!/bin/bash

set -eu

brew tap github/gh
brew tap homebrew/bundle
brew tap homebrew/core

brew upgrade

FORMULAE=(
  awscli
  bat
  coreutils
  copyq
  fzf
  gawk
  gh
  ghq
  git
  git-delta
  hadolint
  jq
  lazygit
  multipass
  navi
  ripgrep
  shellcheck
  starship
  tmux
  tree
  yq
)

for item in "${FORMULAE[@]}"; do
  brew install "$item"
done

# fzf install script
yes | "$(brew --prefix)"/opt/fzf/install

# tmux install script
TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

brew cleanup
