#!/bin/zsh

# Use modern completion system
autoload -Uz compinit

zstyle ':completion:*' menu select

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' \
    'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# And if you want the number of errors allowed by _approximate 
# to increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' \
    max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*' squeeze-slashes true

export LS_COLORS="di=36:ln=33:so=32:pi=32:ex=32:bd=32:cd=32:su=32:sg=32:tw=32:ow=32:"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Completion list
#zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
