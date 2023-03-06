# Default Apps
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export WM="awesome"
#export SHELL="/usr/bin/zsh"

export ZDOTDIR=$HOME/.config/zsh/
export XDG_CONFIG_HOME=$HOME/.config/
export XDG_ENV_HOME=$HOME/

# Adds scripts to $PATH
PATH="${$(find ~/.local/bin -type d -printf %p:)%%:}:$PATH" #:$(find ~/.cargo/bin -type d)

. "$HOME/.cargo/env"
#case ":${PATH}:" in
#    *:"$HOME/.cargo/bin":*)
#        ;;
#    *)
#        # Prepending path in case a system-installed rustc needs to be overridden
#        export PATH="$HOME/.cargo/bin:$PATH"
#        ;;
#esac
