# zsh does not run .profile by default, we call it here
# so as to keep .profile shell independent.

emulate sh
. $HOME/.profile
emulate zsh
