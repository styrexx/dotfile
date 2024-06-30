# Luke's config for the Zoomer Shell


export BUG_PROJECT=$HOME/todo.bug

bug ls
# tab-completion for git 
autoload -Uz compinit && compinit
# setopt nocaseglob
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # for egnore the case 
# git branch name in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
# config the vcs-info (document => zshcontrib)
zstyle ':vcs_info:git:*' formats '⌜%b ⌟ '
zstyle 'vcs_info:*' disable bzr cdv darcs mtn svk tla
zstyle 'vcs_info:*' enable git cvs svn

# Enable colors and change prompt:
autoload -U colors && colors
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=4;90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.html=4;33:*.js=93:*.ts=93:*.jsx=93:*.tsx=93:*.json=1;93:*.h=1;90:*.css=34:*.sass=34:*.scss=34:*.doc=4;34:*.pdf=1;31:*.docx=4;34:*.odt=4;34:*.csv=102:*.xlsx=102:*.xlsm=102:*rb=31:*.cpp=92:*.sh=92:*.zip=4;33:*.tar=4;33:*.xz=4;33:*.bz=4;33:*.gz=4;33:*.mp4=5;36:*.webm=5;36:*.mkv=5;36:*.mp3=106:*.md=1;3;97'
#~Default PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}cd-wb %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PROMPT='%B%{$fg[yellow]%}%n%{$fg[blue]%}@%{$fg[green]%}%m%b%{$fg[magenta]%}:%B${PWD/#$HOME/~}%b %B%{$fg[green]%}${vcs_info_msg_0_}%b%{$fg[yellow]%}✦%{$reset_color%} '

##############
### PROMPT ###
##############
setopt PROMPT_SUBST

declare -a ICONE
ICONE=(
  "󰊕"
  ""
  ""
  "󱘆"
  "✦"
  " "
)
RANDOME=$((RANDOM % 6 + 1 ))
BEGAN=${ICONE[RANDOME]}
# PROMPT=' %B%{$fg[magenta]%}${PWD/#$HOME/~}%b %B%{$fg[green]%}${vcs_info_msg_0_}%b%{$fg[yellow]%}$BEGAN%{$reset_color%} '
# PROMPT='%{$fg[blue]%} %b%B%{$fg[magenta]%}${PWD/#$HOME/~}%b %B%{$fg[green]%}${vcs_info_msg_0_}% %b%{$fg[yellow]%}$BEGAN%{$reset_color%} '
PROMPT='%{$fg[blue]%} %b%B%{$fg[magenta]%}%c%b %B%{$fg[green]%}${vcs_info_msg_0_}% %b%{$fg[yellow]%}$BEGAN%{$reset_color%} '
# ⟷ 🡲 ⎇ ⬌  ⇉ ↳ ↪ ▼ 🟐 ✤ ⌜⌟⌞⌝ 󰿄  󰶯
RPROMPT='%B%F{green}$(uptime -p)%F{red}%(?.. [%? 󰶯 ])%f%b'
# RPROMPT='%F{green}%b%f'
 # to highlighting use %S ... %s
export LS_COLORS

## for better use zsh
setopt correct # autocorect

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# set my editor 
export EDITOR="nvim"
export BROWSER="brave-browser"
export MANPAGER="nvim +Man!"
export VISUAL="$EDITOR"


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
## zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
## zle -N zle-line-init
## echo -ne '\e[5 q' # Use beam shape cursor on startup.
## preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts and alias-fucntion if existent.
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
[ -f "$HOME/.config/zsh/alias-func" ] && source "$HOME/.config/zsh/alias-func"

# fzf
# export FZF_DEFAULT_OPTS="--height=45% --layout=reverse --info=inline --border "
# export FZF_DEFAULT_OPTS='--height=25% --layout=reverse --info=inline --color=bg+:#3B4252,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
export FZF_DEFAULT_OPTS="--height=45% --layout=reverse --info=inline --color=bg+:#458588,spinner:#81A1C1,hl:#fabd2f,fg:#D8DEE9,header:#616E88,info:#fabd2f,pointer:#ebdbb2,marker:#81A1C1,fg+:#D8DEE9,prompt:#458588,hl+:#81A1C1"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#828282,underline"

export PATH="$PATH:/opt/nvim-linux64/bin"
# ~/.zshrc

eval "$(starship init zsh)"
