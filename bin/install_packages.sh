#!/bin/bash

set -eu

brew tap github/gh
brew tap homebrew/bundle
brew tap homebrew/core

brew upgrade

brew install asdf bat coreutils gawk gh ghq git git-delta grep hadolint jq lazygit shellcheck starship tree yq
# fzfはキーバインドを行うスクリプトを別途インストールするため、処理を分ける。
brew install fzf
yes | "$(brew --prefix)"/opt/fzf/install
# brew installをまとめるとToo many open filesで失敗する。依存が多いawscliを分離して様子を見る。
brew install awscli

# tmux setup
brew install tmux

brew cleanup
