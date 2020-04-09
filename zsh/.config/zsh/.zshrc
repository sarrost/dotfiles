#!/bin/zsh

# This file is loaded for all interactive instances of
# zsh.

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

eval $(thefuck --alias)

