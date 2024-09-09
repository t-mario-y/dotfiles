# docker build -t dotfiles_test:latest .
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      git \
      sudo \
      zsh && \
    useradd -s /usr/bin/zsh -g 1000 dotfiles_test && \
    echo -e "foo\nfoo\n" | passwd dotfiles_test

USER dotfiles_test
WORKDIR /home/dotfiles_test
