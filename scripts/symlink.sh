#!/bin/bash

set -eu

ln -snfv ~/dotfiles/.zsh/.zshrc      ~/.zshrc
ln -snfv ~/dotfiles/.gitconfig       ~/.gitconfig
ln -snfv ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/navi
ln -snfv ~/dotfiles/starship.toml ~/.config/starship.toml

if [ "$(uname)" = 'Linux' ]; then
  mkdir -p ~/.config/lazygit
  lazygit_config_file=~/.config/lazygit/config.yml
fi

if [ "$(uname)" = 'Darwin' ]; then
  mkdir -p "$HOME"/Library/Application\ Support/lazygit
  lazygit_config_file=$HOME/Library/Application\ Support/lazygit/config.yml
fi

ln -snfv ~/dotfiles/.config/lazygit/config.yml "$lazygit_config_file"
ln -snfv ~/dotfiles/navi/config.yaml ~/.config/navi/config.yaml
ln -snfv ~/dotfiles/.tool-versions ~/.tool-versions
