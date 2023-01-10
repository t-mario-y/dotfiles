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
  fd
  gawk
  gh
  ghq
  git
  git-delta
  hadolint
  jq
  kubectl
  lazygit
  navi
  shellcheck
  starship
  ripgrep
  tree
  yq
)

for item in "${FORMULAE[@]}"; do
  brew install "$item"
done

# krew
if type kubectl krew > /dev/null 2>&1; then
  echo 'kubectl krew is already installed.'
else
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
fi

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