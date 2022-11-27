# Aliases

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

_exists(){
    command -v $1 > /dev/null 2>$1
}

# Go to the /home/$USER (~) directory, clears the terminal window 
alias q="~ && clear && paleofetch"
alias cl="clear && paleofetch"

# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Docs/github ]          && alias ggh='cd ~/Docs/github'  
[ -d ~/personal ]             && alias p='cd ~/personal'
[ -d ~/work ]                 && alias p='cd ~/work'
[ -d ~/.config ]              && alias dotf='cd ~/.config'

# nvim 
alias n='nvim'
alias nr='nvim -R'

# ls
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'
