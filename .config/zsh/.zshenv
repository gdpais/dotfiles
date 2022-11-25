# Default Apps
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export WM="i3"

# Adds scripts to $PATH
PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}:$(find ~/.cargo/bin -type d)"
