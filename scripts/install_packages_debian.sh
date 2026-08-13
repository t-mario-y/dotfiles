#!/bin/bash

set -eu

sudo apt-get upgrade && sudo apt-get install -y --no-install-recommends \
  jq \
  tree 
sudo apt-get autoremove -y

if type gh > /dev/null 2>&1; then
  echo 'gh is already installed.'
else
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install gh
fi

if type tmux > /dev/null 2>&1; then
  echo 'tmux is already installed.'
else
  sudo apt-get install -y tmux
fi

TPM_PATH=~/.tmux/plugins/tpm
if [ ! -e $TPM_PATH ]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

if type hx > /dev/null 2>&1; then
  echo 'helix editor is already installed.'
else
  sudo add-apt-repository -y ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install -y helix
fi
