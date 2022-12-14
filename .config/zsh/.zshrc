paleofetch

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colros and change prompt
autoload -U colors && colors

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

autoload -U compinit && compinit -u
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix
zstyle ':completion:*' ignore-parents parent pwd directory
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:lower:]}={[:upper:]} l:|=* r:|=*' '+'
zstyle ':completion:*' menu select

zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

setopt autocd nomatch
unsetopt beep

# vi mode
bindkey -v

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line
# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
 [[ $1 = 'block' ]]; then
echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
   [[ ${KEYMAP} == viins ]] ||
   [[ ${KEYMAP} = '' ]] ||
   [[ $1 = 'beam' ]]; then
echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
for c in {a,i}{\',\",\`}; do
bindkey -M $m $c select-quoted
done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
bindkey -M $m $c select-bracketed
done
done


echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Control bindings for programs
bindkey -s "^h" "history 1\n"
bindkey -s "^l" "clear\n"
bindkey -s "^f" "tmux-sessionizer\n"

# spaceship prompt
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_PYTHON_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_ASYNC_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_JOBS_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

source /usr/share/zsh/plugins/spaceship/spaceship.zsh
# Aliases
source ~/.config/lib/aliases.zsh
# Smartdots
source ~/.config/lib/smartdots.zsh
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

