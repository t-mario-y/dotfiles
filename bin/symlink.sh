#!/bin/bash

set -eux

ln -snfv ~/dotfiles/.zshrc     ~/.zshrc
ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml

