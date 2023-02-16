# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"
alias ll="ls -alh"
# alias for apt-get
alias i="sudo apt-get install"
alias ug="sudo apt-get upgrade"
alias up="sudo apt-get update"
alias r="apt-get remove"
alias q="apt search"
# alias for vim
alias vi="nvim"
# alias for git
alias gad="git add"
alias gcm="git commit"
alias gph="git push"
alias gpll="git pull"
