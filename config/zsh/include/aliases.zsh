# Aliases

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Go to the /home/$USER (~) directory, clears the terminal window
alias q="~ && clear"
#alias cl="clear && paleofetch"

# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/personal ]             && alias p='cd ~/personal'
[ -d ~/work ]                 && alias w='cd ~/work'
[ -d ~/.config ]              && alias conf='cd ~/.config'

# nvim
alias n='nvim'
alias nr='nvim -R'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'

# grep
alias grep='grep --color=auto'

# git
alias gs="git status"
alias gpull="git pull"
alias gpr="git pull --rebase"
alias gpush="git push"
alias gd="git diff"
alias gadd="git add ."
alias gca='git add . && git commit -av'
alias gundo='git reset HEAD~'
# Logging helpers
alias glg='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gldate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'
