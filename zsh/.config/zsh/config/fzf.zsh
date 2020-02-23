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
