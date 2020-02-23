# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Where to find cursor themes.
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

# Disable ctrl-s and ctrl-q.
stty -ixon

# Enable comments in interactive mode
setopt INTERACTIVE_COMMENTS

# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# Needed for broot
source /home/sarrost/.config/broot/launcher/bash/br

# Control bindings for programs
bindkey -s "^f" "vifm\n"
bindkey -s "^l" "clear\n"

# Load configs
for f in $ZDOTDIR/config/*.zsh; do source "$f"; done

# load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
