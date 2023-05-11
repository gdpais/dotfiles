# Default Apps
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export WM="awesome"

export ZDOTDIR=$HOME/.config/zsh/
export XDG_CONFIG_HOME=$HOME/.config/
export XDG_ENV_HOME=$HOME/
export PYENV_ROOT="$HOME/.pyenv"
export PNPM_HOME="$HOME/.local/share/pnpm"

# Adds scripts to $PATH
command -v pyenv >/dev/null || export PATH="$HOME/.pyenv/bin:$PATH"

PATH="${$(find ~/.local/bin -type d -printf %p:)%%:}:$PATH" #:$(find ~/.cargo/bin -type d)

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

. "$HOME/.cargo/env"
#case ":${PATH}:" in
#    *:"$HOME/.cargo/bin":*)
#        ;;
#    *)
#        # Prepending path in case a system-installed rustc needs to be overridden
#        export PATH="$HOME/.cargo/bin:$PATH"
#        ;;
#esac

[ -d $HOME/go/bin ] && PATH=$PATH:$HOME/go/bin
[ -d /usr/local/go/bin ] && PATH=$PATH:/usr/local/go/bin
