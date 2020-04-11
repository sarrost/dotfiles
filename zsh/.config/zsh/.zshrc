#!/bin/zsh

#〖愛〗Zsh configuration file.
#
# This file is loaded for all interactive instances of
# zsh.
#
# Tho keep things clean and orderly majority of the actual
# configuration is housed in `./config`. All `.zsh` files
# in that dir are automatically sourced.


# This is done in `zshenv` and here again.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

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

# For `thefuck`, has to be last
eval $(thefuck --alias)
