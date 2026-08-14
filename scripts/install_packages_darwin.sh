#!/bin/bash

set -eu

brew upgrade

FORMULAE=(
  awscli
  colima
  coreutils
  findutils
  gawk
  gnu-sed
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

brew cleanup

# tmux install script
TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi
