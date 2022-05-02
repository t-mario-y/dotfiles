#!/bin/bash

set -eux

brew tap github/gh
brew tap homebrew/bundle
brew tap homebrew/core

brew upgrade

brew install asdf awscli coreutils gawk gh ghq git git-delta grep hadolint jq lazygit shellcheck starship tree yq
# fzfはキーバインドを行うスクリプトを別途インストールするため、処理を分ける。
brew install fzf
yes | "$(brew --prefix)"/opt/fzf/install

brew cleanup
