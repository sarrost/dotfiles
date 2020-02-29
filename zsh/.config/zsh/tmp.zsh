#!/bin/zsh

# This file is loaded for all interactive instances of
# zsh.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Ammend PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Where to find cursor themes.
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

# Load configs (if any exist)
[ -d $ZDOTDIR/config ] && \
for f in $ZDOTDIR/config/*.zsh; do source "$f"; done

# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh \
    2>/dev/null
#!/bin/zsh

# load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
#!/bin/zsh

# Needed for broot
source /home/sarrost/.config/broot/launcher/bash/br
#!/bin/zsh

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


# Completion list
#zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
#!/bin/zsh

# CTRL-Z starts previously suspended process.
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
#!/bin/zsh

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sarrost/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sarrost/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sarrost/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/sarrost/.fzf/shell/key-bindings.zsh"
#!/bin/zsh

# This script houses some misc bindings for zsh.

bindkey -s "^f" "vifm\n"
bindkey -s "^h" "cd .. && clear\n"
#!/bin/zsh

# This script houses misc options for zsh

# Enable comments in interactive mode
setopt INTERACTIVE_COMMENTS

# cd by typing directory name
setopt AUTO_CD

# Disable ctrl-s and ctrl-q.
stty -ixon
#!/bin/zsh

# zsh history.
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="$ZDOTDIR/.zsh_history"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
#!/bin/sh

# This script enables zsh-notify and configures it.

source /usr/share/zsh/plugins/zsh-notify/notify.plugin.zsh 2>/dev/null

zstyle ':notify:*' command-complete-timeout 10
zstyle ':notify:*' error-title "Failed in #{time_elapsed}"
zstyle ':notify:*' success-title "Completed in #{time_elapsed}"
#!/bin/zsh

# Prompt options
SPACESHIP_CHAR_SYMBOL=↪
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_CHAR_COLOR_SUCCESS="red"
SPACESHIP_CHAR_COLOR_FAILURE="yellow"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_BATTERY_THRESHOLD=30
SPACESHIP_JOBS_SYMBOL=""
SPACESHIP_JOBS_AMOUNT_PREFIX=" "

# Set prompt
autoload -U promptinit; promptinit
prompt spaceship
#!/bin/zsh

# This script creates a simple mapping for the `pwdxsel`
# script.

# Get working dir
getworkingdir () { pwdxsel }
zle -N getworkingdir                  
bindkey '^p' getworkingdir   
#!/bin/zsh

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
#!/bin/zsh

# Export vim-stardict installation directory
# NOTE: Only do this if your vim-stardict installation directory is other
# than ${HOME}/.vim/bundle/vim-stardict. In other words, uncomment these
# lines if you are not using Vundle, Pathogen or NeoBundle to manage your
# Vim plugins:
#export STARDICT_DIR="$HOME/.vim/bundle/vim-stardict"

# For Zsh: The path to the stardict.zsh file is
# "${HOME}"/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh
if [[ -f "$HOME/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh" ]]; then
    source "$HOME/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh"
fi

# To avoid typing the long & daunting 'stardict' & 'vstardict'
# commands, you can alias it to something else
alias whatis="stardict"

# OPTIONAL: You can change the colors of output of vim-stardict inside
# Bash (see below for the comprehensive list of color codes in Bash):
# export STARDICT_RESULT="\033[0;31m"               # Defaut value
# export STARDICT_WORD="\033[0;91m"                 # Defaut value
# export STARDICT_WORD_TYPE="\033[0;32m"            # Defaut value
# export STARDICT_WORD_MEANING="\033[0;34m"         # Defaut value
# export STARDICT_WORD_EXAMPLE="\033[0;33m"         # Defaut value
# export STARDICT_DICT_NAME="\033[0;95m"            # Defaut value

# OPTIONAL: You can change the path to the python executable that
# vim-stardict uses for Bash/Zsh lookup (which is "/usr/bin/python"
# by default).
# export STARDICT_PYTHON_PATH="/usr/bin/python"     # Defaut value
#!/bin/zsh

# This script enables zsh-syntax-highlighting and configures
# colors for it. must have 256 (4-bit) colors enabled. The
# quality of the end result depends on the terminal theme,
# that is, colors 0-15.
# 
# See: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# for more details.

# Load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

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
#!/bin/zsh

## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
    case $(tmux showenv TERM 2>/dev/null) in
        *256color) ;&
        TERM=fbterm)
            TERM=screen-256color ;;
        *)
            TERM=screen
    esac
fi
#!/bin/zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Ctrl-v from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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
