#!/bin/bash

set -eu

brew tap github/gh
brew tap homebrew/bundle
brew tap homebrew/core

brew upgrade

FORMULAE=(
  awscli
  asdf
  bat
  coreutils
  eth-p/software/bat-extras-batgrep
  gawk
  gh
  ghq
  git
  git-delta
  hadolint
  jq
  lazygit
  shellcheck
  starship
  ripgrep
  tree
  yq
)

for item in "${FORMULAE[@]}"; do
  brew install "$item"
done

# fzfはキーバインドを行うスクリプトを別途インストールするため、処理を分ける。
brew install fzf
yes | "$(brew --prefix)"/opt/fzf/install

# tmux setup
brew install tmux
TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

brew cleanup
