#!/bin/zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# Auto-completion
#-----------------------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
#-----------------------------
source "/usr/share/fzf/key-bindings.zsh"
