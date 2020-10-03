#!/bin/zsh

#〖愛〗zsh profile

# zsh does not run .profile by default, we call it here
# so as to keep .profile independent.
emulate sh
. $HOME/.profile
emulate zsh
