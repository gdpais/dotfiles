#!/usr/bin/env bash

fzfit() {
    dir=$(find ~/work ~/personal ~/personal/mynotebook ~/personal/dotfiles ~/personal/dotfiles/config ~/ ~/build ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)

    if [[ -d $dir ]]; then
        cd $dir
    fi
}
