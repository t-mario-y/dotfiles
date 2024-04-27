#!/bin/bash

set -eu

mkdir -p ~/.config/{helix,navi}
ln -snfv ~/dotfiles/.zsh/.zshrc      ~/.zshrc
ln -snfv ~/dotfiles/.gitconfig       ~/.gitconfig
ln -snfv ~/dotfiles/.tool-versions   ~/.tool-versions
ln -snfv ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -snfv ~/dotfiles/starship.toml    ~/.config/starship.toml
ln -snfv ~/dotfiles/helix/config.toml    ~/.config/helix/config.toml
ln -snfv ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -snfv ~/dotfiles/navi/config.yaml     ~/.config/navi/config.yaml
if [ "$(uname)" = 'Linux' ]; then
  mkdir -p ~/.config/lazygit
  lazygit_config_file=~/.config/lazygit/config.yml
fi

if [ "$(uname)" = 'Darwin' ]; then
  mkdir -p "$HOME"/Library/Application\ Support/lazygit
  lazygit_config_file=$HOME/Library/Application\ Support/lazygit/config.yml
fi

ln -snfv ~/dotfiles/lazygit/config.yml "$lazygit_config_file"
