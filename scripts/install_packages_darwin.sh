#!/bin/bash

set -eu

brew tap github/gh
brew tap homebrew/bundle

brew upgrade

FORMULAE=(
  awscli
  colima
  coreutils
  # copyq
  gawk
  grep
  gh
  git
  helix
  jq
  # multipass
  shellcheck
  tmux
  tree
  watch
  wezterm
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
