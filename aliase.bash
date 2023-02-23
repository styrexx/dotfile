# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
# alias ls="${aliases[ls]:-ls} -A"
alias ll="ls -alh"

# alias for apt-get
alias i="sudo apt-get install"
alias ug="sudo apt-get upgrade"
alias up="sudo apt-get update"
alias r="sudo apt-get remove"
alias ar="sudo apt autoremove"
alias l="apt list"
alias fug="sudo apt full-upgrade"
alias q="apt search"
# alias for vim
alias vi="nvim"
# alias for git
alias gst="git status"
alias gad="git add"
alias gcm="git commit"
alias gph="git push"
alias gpl="git pull"
alias gphu="git push -u origin main"
alias gbr="git branch"
alias grm="git remote"
alias gsh="git stash"
alias gshp="git stash pop"
alias gchk="git checkout"
