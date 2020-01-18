# if you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh

export HISTFILE="$ZDOTDIR/.zsh_history"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# enable plugins
plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
  vi-mode
)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"



# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# disable ctrl-s and ctrl-q.
stty -ixon


# cache stuff
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi


# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='nvim'
#fi

# enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"


# load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"


## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=fbterm)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi



# Export vim-stardict installation directory
# NOTE: Only do this if your vim-stardict installation directory is other
# than ${HOME}/.vim/bundle/vim-stardict. In other words, uncomment these
# lines if you are not using Vundle, Pathogen or NeoBundle to manage your
# Vim plugins:
#export STARDICT_DIR="$HOME/.vim/bundle/vim-stardict"

# For Bash: Source the stardict.sh file in the vim-stardict installation
# directory.
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

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
