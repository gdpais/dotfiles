# Aliases

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

_exists(){
    command -v $1 > /dev/null 2>$1
}

# Go to the /home/$USER (~) directory, clears the terminal window and executes paleofetch
alias q="~ && clear && paleofetch"

# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Docs/github ]          && alias gh='cd ~/Docs/github'  
[ -d ~/.config ]              && alias dotf='cd ~/.config'

# nvim 
alias nvimr='nvim -R'
#alias nv='nvim'

# Spotifyd + Spotify-tui
alias spt='gospt'

# ls
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# cat with highlighting
if _exists bat; then
    alias cat='bat'
fi

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'
