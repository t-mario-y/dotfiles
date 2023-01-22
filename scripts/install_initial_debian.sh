#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  lsb-release \
  unzip \ # for asdf-ghq
  zsh
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get install -y git
sudo apt-get autoremove -y
