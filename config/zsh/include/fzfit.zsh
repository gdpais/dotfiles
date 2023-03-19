#!/usr/bin/env bash

fzfit() {
    cd $(find ~/work ~/personal ~/personal/mynotebook ~/ ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
}
