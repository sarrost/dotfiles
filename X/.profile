#〖愛〗Profile configuration file.
#
# This file is automatically run upon login--before the
# graphical server is started. Set global environmental 
# variables here.

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Adds `~/sh/scripts/` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/sh/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Add go bins to PATH
export PATH=$HOME/.local/go/bin:$PATH

# Add gem env to $PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Set globals.
export BROWSER="brave"
export EDITOR="nvim"
export MANPAGER="nvim -c 'set ft=neoman' -"
export READER="zathura"
export TERMINAL="st"

# RICE (Treated like XDG DIRs, but custom)
export RICE_MEDIA_DIR="$HOME/media"
export RICE_ANIME_DIR="$RICE_MEDIA_DIR/anime"
export RICE_ARTICLES_DIR="$RICE_MEDIA_DIR/article"
export RICE_CODE_DIR="$HOME/code"
export RICE_DOTFILES_DIR="$HOME/dt"
export RICE_GAMES_DIR="$RICE_MEDIA_DIR/game"
export RICE_LIBRARY_DIR="$RICE_MEDIA_DIR/lib"
export RICE_MOUNT_DIR="$HOME/mnt"
export RICE_NOTES_DIR="$XDG_DOCUMENTS_DIR/notes"
export RICE_REPOSITORY_DIR="$HOME/repo"
export RICE_SCRIPTS_DIR="$HOME/sh/scripts"

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/.desk"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$RICE_MEDIA_DIR/music"
export XDG_PICTURES_DIR="$RICE_MEDIA_DIR/pic"
export XDG_PUBLICSHARE_DIR="$HOME/.public"
export XDG_TEMPLATES_DIR="$HOME/tp"
export XDG_VIDEOS_DIR="$RICE_MEDIA_DIR/vid"
export XDG_CACHE_HOME="$HOME/.cache"

# OCD
export GOPATH="$HOME/.local/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# Python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/.pyrc

# Vim
#export VIMINIT="source $XDG_CONFIG_HOME/vim/.vimrc"

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
