#!/bin/zsh

# zsh history.
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="$ZSH_CUSTOM/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
