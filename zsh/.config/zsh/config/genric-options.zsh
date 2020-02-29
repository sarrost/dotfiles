#!/bin/zsh

# This script houses misc options for zsh

# Enable comments in interactive mode
setopt INTERACTIVE_COMMENTS

# cd by typing directory name
setopt AUTO_CD

# Disable ctrl-s and ctrl-q.
stty -ixon
