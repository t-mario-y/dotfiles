#!/bin/bash

set -eu

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  lsb-release \
  zsh
sudo apt-add-repository ppa:git-core/ppa --yes
sudo apt-get install -y git
sudo apt-get autoremove
