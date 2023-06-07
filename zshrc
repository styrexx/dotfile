# Luke's config for the Zoomer Shell

# tab-completion for git 
autoload -Uz compinit && compinit
# git branch name in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
# config the vcs-info (document => zshcontrib)
zstyle ':vcs_info:git:*' formats '[%b]'
zstyle 'vcs_info:*' disable bzr cdv darcs mtn svk tla
zstyle 'vcs_info:*' enable git cvs svn

# Enable colors and change prompt:
autoload -U colors && colors
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.html=33:*.js=93:*.h=90:*.css=34:*.doc=104:*.pdf=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*rb=31:*.cpp=92:*.sh=92:*.zip=4;33:*.tar=4;33:*.xz=4;33:*.bz=4;33:*.gz=4;33:*.mp4=105:*.mp3=106:*.md=90'
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}cd%{$fg[green]%}-%{$fg[blue]%}wb %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b${vcs_info_msg_0_} "
#~Default PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}cd-wb %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt PROMPT_SUBST
# PROMPT='%{$fg[red]%}[%{$fg[yellow]%}cd%{$fg[green]%}-%{$fg[blue]%}wb %{$fg[magenta]%}${PWD/#$HOME/~} %{$fg[green]%}${vcs_info_msg_0_}%{$fg[red]%}]%{$reset_color%}$ '
PROMPT='%{$fg[cyan]%}$ %B%{$fg[yellow]%}%n%b %{$fg[blue]%}in ${PWD/#$HOME/~} %B%{$fg[green]%}${vcs_info_msg_0_}%b%{$fg[yellow]%}->>%{$reset_color%} '
# RPROMPT='%B%{$fg[green]%}${vcs_info_msg_0_}%b' #to show info in the right of the terminal
# RPROMPT='[%F{yellow}%.%f]'
export LS_COLORS


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

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
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
# [ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
