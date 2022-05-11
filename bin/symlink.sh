#!/bin/bash

set -eu

ln -snfv ~/dotfiles/.zshrc     ~/.zshrc
ln -snfv ~/dotfiles/.zprofile  ~/.zprofile
ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -snfv ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml
