#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get upgrade -y
# libz-dev for asdf-ruby, unzip for asdf-ghq
sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  libz-dev \
  lsb-release \
  unzip \
  zsh
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get install -y git
sudo apt-get autoremove -y
