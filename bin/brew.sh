#!/bin/bash

set -eux

brew tap github/gh
brew tap homebrew/bundle
brew tap homebrew/core

brew install asdf awscli coreutils gawk gh ghq git git-delta grep hadolint jq lazygit shellcheck starship tree yq

# fzfはキーバインドが必要なので別途インストールする
brew install fzf
yes | "$(brew --prefix)"/opt/fzf/install
