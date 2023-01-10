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

if type asdf > /dev/null 2>&1; then
  echo 'asdf is already installed.'
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
fi
