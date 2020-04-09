#!/bin/zsh

# This script creates a simple mapping for the `pwdxsel`
# script.

# Get working dir
getworkingdir () { pwdclipboard }
zle -N getworkingdir                  
bindkey '^p' getworkingdir   
