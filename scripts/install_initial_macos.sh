#!/bin/bash

set -eu

if type brew > /dev/null 2>&1; then
  echo 'homebrew is already installed.'
else
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  if [ "$(uname)" = 'Darwin' ] && [ "$(uname -p)" = 'arm' ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew upgrade
  brew install gcc
  brew cleanup
fi
