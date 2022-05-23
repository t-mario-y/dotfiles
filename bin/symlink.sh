#!/bin/bash

set -eu

ln -snfv ~/dotfiles/.zsh/.zshrc     ~/.zshrc
ln -snfv ~/dotfiles/.zsh/.zprofile  ~/.zprofile
ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -snfv ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/lazygit ~/.config/navi
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml

ln -snfv ~/dotfiles/navi/config.yaml ~/.config/navi/config.yaml

if [ "$(uname)" = 'Linux' ]; then
  lazygit_config_file=~/.config/lazygit/config.yml
fi

if [ "$(uname)" = 'Darwin' ]; then
  lazygit_config_file=~/Library/Application\ Support/lazygit/config.yml
fi

ln -snfv ~/dotfiles/.config/lazygit/config.yml "$lazygit_config_file"
