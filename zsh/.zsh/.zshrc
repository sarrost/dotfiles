# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Where to find cursor themes.
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

# zsh home dir.
export ZSH_CUSTOM=$HOME/.zsh

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# Disable ctrl-s and ctrl-q.
stty -ixon

# Control bindings for programs
bindkey -s "^f" "vifm\n"
bindkey -s "^l" "clear\n"

# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"


#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# Needed for broot
source /home/sarrost/.config/broot/launcher/bash/br

# Load configs
for f in $ZSH_CUSTOM/config/*.zsh; do source "$f"; done
