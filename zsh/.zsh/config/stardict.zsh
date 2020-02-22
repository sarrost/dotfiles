#!/bin/zsh

# Export vim-stardict installation directory
# NOTE: Only do this if your vim-stardict installation directory is other
# than ${HOME}/.vim/bundle/vim-stardict. In other words, uncomment these
# lines if you are not using Vundle, Pathogen or NeoBundle to manage your
# Vim plugins:
#export STARDICT_DIR="$HOME/.vim/bundle/vim-stardict"

# For Zsh: The path to the stardict.zsh file is
# "${HOME}"/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh
if [[ -f "$HOME/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh" ]]; then
    source "$HOME/.vim/bundle/vim-stardict/bindings/zsh/stardict.zsh"
fi

# To avoid typing the long & daunting 'stardict' & 'vstardict'
# commands, you can alias it to something else
alias whatis="stardict"

# OPTIONAL: You can change the colors of output of vim-stardict inside
# Bash (see below for the comprehensive list of color codes in Bash):
# export STARDICT_RESULT="\033[0;31m"               # Defaut value
# export STARDICT_WORD="\033[0;91m"                 # Defaut value
# export STARDICT_WORD_TYPE="\033[0;32m"            # Defaut value
# export STARDICT_WORD_MEANING="\033[0;34m"         # Defaut value
# export STARDICT_WORD_EXAMPLE="\033[0;33m"         # Defaut value
# export STARDICT_DICT_NAME="\033[0;95m"            # Defaut value

# OPTIONAL: You can change the path to the python executable that
# vim-stardict uses for Bash/Zsh lookup (which is "/usr/bin/python"
# by default).
# export STARDICT_PYTHON_PATH="/usr/bin/python"     # Defaut value
