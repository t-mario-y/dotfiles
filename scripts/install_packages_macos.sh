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
  gawk
  gh
  git
  jq
  multipass
  ripgrep
  shellcheck
  tmux
  tree
)

for item in "${FORMULAE[@]}"; do
  brew install "$item"
done

# tmux install script
TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

brew cleanup
