#! /bin/bash

set -x

if [[ -d "$HOME/.config" ]]; then
    MOVE_CONFIG=true
fi

if [[ $MOVE_CONFIG ]]; then
    echo "Moving config"
    mv ~/.config ~/_temp_config
fi

ln -sv ~/personal/dotfiles/config ~/.config

if [[ $MOVE_CONFIG ]]; then
    cp -r ~/_temp_config/* ~/.config/
    rm -rf ~/_temp_config
fi

# Home files
if [[ -f "$HOME/.zshenv" ]]; then
    rm $HOME/.zshenv
fi

ln -sv ~/personal/dotfiles/.zshenv ~/.zshenv

sudo apt-get update && sudo apt-get install zsh

chsh -s $(which zsh)
