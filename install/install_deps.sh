#!/bin/bash

set -e
set -x

mkdir -p ~/build

sudo apt-get install -y \
    make git \
    ninja-build gettext cmake g++ pkg-config unzip curl \
    libtool libtool-bin autoconf automake \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev \
    zsh

# Rust
if ! [ -x "$(command -v cargo)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install git-trim \
	ripgrep \
	starship

# Neovim
if ! [ -d $HOME/build/neovim ]; then
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
fi

# Git extend
if ! [ -d ~/build/delta ]; then
  git clone https://github.com/dandavison/delta ~/build/delta

  cd ~/build/delta
  cargo install --path .
fi

# Python
if ! [ -d $HOME/.pyenv ]; then
  curl https://pyenv.run | bash
fi

# Kitty term
if ! command -v kitty &> /dev/null ; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# Zsh default
#chsh -s $(which zsh)
