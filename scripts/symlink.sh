#!/bin/bash

set -eu

# TODO: quit homebrew dependency
ln -snfv ~/dotfiles/.zsh/.zshrc      ~/.zshrc
ln -snfv ~/dotfiles/.gitconfig       ~/.gitconfig
ln -snfv ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml

if [ "$(uname)" = 'Linux' ]; then
  mkdir -p ~/.config/lazygit ~/.config/navi
  lazygit_config_file=~/.config/lazygit/config.yml
  navi_config_file=~/.config/navi/config.yaml
fi

if [ "$(uname)" = 'Darwin' ]; then
  mkdir -p "$HOME"/Library/Application\ Support/lazygit "$HOME"/Library/Application\ Support/navi
  lazygit_config_file=$HOME/Library/Application\ Support/lazygit/config.yml
  navi_config_file=$HOME/Library/Application\ Support/navi/config.yaml
fi

ln -snfv ~/dotfiles/.config/lazygit/config.yml "$lazygit_config_file"
ln -snfv ~/dotfiles/navi/config.yaml "$navi_config_file"
