#!/usr/bin/env bash

# Quick change directories
# Expands .... -> ../../..
# https://github.com/denysdovhan/dotfiles/blob/master/lib/smartdots.zsh

smartdots() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N smartdots
bindkey . smartdots
