FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      git \
      sudo \
      zsh

RUN useradd -s /usr/bin/zsh -g 1000 dotfiles_test && \
    echo "dotfiles_test:foo" | chpasswd && \
    usermod -G sudo dotfiles_test 

USER dotfiles_test

# test script:
# docker build -t dotfiles_test:latest .
# docker run --rm -it dotfiles_test:latest
# sudo apt-get install software-properties-common
# git clone https://github.com/t-mario-y/dotfiles
# ...
