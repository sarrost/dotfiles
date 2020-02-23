#! /usr/bin/env sh

# ~/.profile is automai executed upon login.

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Add gem env to $PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Set globals.
export BROWSER="brave"
export EDITOR="nvim"
export GTK2_RC_FILES=/home/sarrost/.gtkrc-2.0
export MANPAGER="nvim -c 'set ft=neoman' -"
export READER="zathura"
#export TERMINAL="urxvt"
export TERMINAL="st"
export ZDOTDIR="$HOME/.zsh/"

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
