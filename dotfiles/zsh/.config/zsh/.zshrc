#!/bin/zsh

#〖愛〗zsh configuration

#-----------------------------------------------------------
# Disable ctrl-s and ctrl-q.
[[ $- == *i* ]] && stty -ixon
#-----------------------------------------------------------
### Prompt
# Enable Powerlevel10k instant prompt. Should stay close to 
# the top of ~/.zshrc. Initialization code that may require 
# console input (password prompts, [y/n] confirmations, 
# etc.) must go above this block; everything else may go 
# below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-----------------------------------------------------------
### [script] vpwd
export TERM_ID=$PPID

#-----------------------------------------------------------
### Aliases and shortcuts
# load aliases
[ -f "$XDG_CONFIG_HOME/aliasrc" ] && source "$XDG_CONFIG_HOME/aliasrc"
# load dir switching shortcuts
[ -f "$XDG_DATA_HOME/zsh/shortcuts.zsh" ] && source "$XDG_DATA_HOME/zsh/shortcuts.zsh"

#-----------------------------------------------------------
### General settings
# Change dir without cd
setopt auto_cd
# enable comments in interactive mode
setopt INTERACTIVE_COMMENTS
# enable history
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
[ -d "$XDG_DATA_HOME/zsh/history" ] || mkdir -p $XDG_DATA_HOME/zsh
export HISTFILE="$XDG_DATA_HOME/zsh/history"
# ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
# ignore commands preceeded by a space
setopt hist_ignore_space
# share history between shells
setopt SHARE_HISTORY

#-----------------------------------------------------------
### Completion
# TODO: cleanup and doc
# Use modern completion system
autoload -Uz compinit

zstyle ':completion:*' menu select

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' \
    'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# And if you want the number of errors allowed by _approximate 
# to increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' \
    max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*' squeeze-slashes true

export LS_COLORS="di=36:ln=33:so=32:pi=32:ex=32:bd=32:cd=32:su=32:sg=32:tw=32:ow=32:"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# store out of sight
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh" 

# Completion list
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots)		# Include hidden files.

#-----------------------------------------------------------
### Fancy ctrl-z
# ctrl-z starts previously suspended process.
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    bg &>/dev/null
    zle redisplay
    fg &>/dev/null
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z 

#-----------------------------------------------------------
### FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS="--color='hl:48,hl+:50,bg+:234,gutter:-1,pointer:49,marker:50,info:51,prompt:47'"
# Auto-completion
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
# Key bindings
source "/usr/share/fzf/key-bindings.zsh"
bindkey '^O' fzf-cd-widget

#-----------------------------------------------------------
### General key bindings
# bind vim, assuming v is aliased to vim
bindkey -s "^E" "v\n"
# bind vim, assuming v is aliased to vim
bindkey -s "^G" "nvim -c 'G' -c 'only'\n"
# bind vifm
bindkey -s "^F" "vifm\n"
# bind cf
bindkey -s "^S" "cf\n"
# bind pwdclipboard [script]
getworkingdir () { pwdclipboard }
zle -N getworkingdir                  
bindkey '^p' getworkingdir   

#-----------------------------------------------------------
### Rationalise dot
# Quicker cd up parent directories, cd .... instead of cd ../..
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

#-----------------------------------------------------------
### Syntax highlighting
# define some custom colors
color_ao=35
color_brightao=47
color_gray=240
color_lightgray=249
color_brightcyan=157
color_lightblue=123

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# unknown tokens / errors
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$color_gray,bold"

# aliases
ZSH_HIGHLIGHT_STYLES[alias]="fg=blue,bold"

# shell builtin commands (shift, pwd, zstyle)
ZSH_HIGHLIGHT_STYLES[builtin]="fg=blue,bold"

# function names
ZSH_HIGHLIGHT_STYLES[function]="fg=blue,bold"

# existing filenames
ZSH_HIGHLIGHT_STYLES[path]="fg=cyan,underline"

# precommand modifiers (e.g., noglob, builtin)
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$color_lightgray,bold"

# command names
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan,bold"

# globbing expressions (*.txt)
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$color_brightao,bold"

# command substitution delimeters ( $() , `` )
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=$color_gray"

#process substitution delimiters (<( and ))
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$color_gray"

# quoted arguments ("foo", 'foo', $'foo')
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$color_ao"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$color_brightao"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$color_lightblue"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=$color_gray"

# hyphen options (-o, --option)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$color_lightgray"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$color_lightgray"

# parameter assignments (x=foo and x=( ))
ZSH_HIGHLIGHT_STYLES[assign]="fg=$color_lightgray"

# redirection operators (<, >, etc)
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$color_lightgray"

# comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
ZSH_HIGHLIGHT_STYLES[comment]="fg=$color_gray"

# parameter expansion inside quotes ($foo inside "")
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$color_brightcyan"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$color_brightcyan"

#-----------------------------------------------------------
### vi mode
# enable vi mode
bindkey -v
export KEYTIMEOUT=1
# edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# ctrl-v from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
# use beam shape cursor on startup
echo -ne '\e[5 q' 
# use beam shape cursor for each new prompt
precmd() { echo -ne '\e[5 q' ;}

# change cursor shape for different vi modes
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
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

# Surround: ds, cs and ys
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround

#  This doesn't allow yss to operate on a line but VS will work
bindkey -M visual S add-surround

zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init

#-----------------------------------------------------------
### Forgit
# Load forgit
if [ -f $RICE_WORLD_REPO_DIR/forgit/forgit.plugin.zsh ]; then
	source $RICE_WORLD_REPO_DIR/forgit/forgit.plugin.zsh
fi

#-----------------------------------------------------------
### Prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/cd/world/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f .config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# Load zsh-syntax-highlighting (must be sourced at end)
if [ -f "$RICE_WORLD_REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]; then
	source "$RICE_WORLD_REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" 
fi
