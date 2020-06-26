#〖愛〗Profile configuration file.

# This file is automatically run upon login--before the
# graphical server is started. Set global environmental 
# variables here.

add_to_path() {
	export PATH="$PATH:$(du -L "$1" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
}
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.local/go/bin"

# Programs
export BROWSER="brave"
export EDITOR="vpwd_nvim"
export FILE_BROWSER="vpwd_vifm"
export MANPAGER="nvim -c 'set ft=neoman' -"
export READER="zathura"
export STATUSBAR="dwmblocks"
export SUDO_ASKPASS="dmenupass"
export TERMINAL="st"

# RICE (treated like XDG dirs, but custom)
export RICE_MEDIA_DIR="$HOME/md"
export RICE_DOTFILES_DIR="$HOME/dt"
export RICE_SCRIPTS_DIR="$HOME/.sh/scripts"
add_to_path "$RICE_SCRIPTS_DIR"
# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_PUBLICSHARE_DIR="$HOME/.public"
export XDG_DESKTOP_DIR="$HOME/.desk"
export XDG_TEMPLATES_DIR="$XDG_DATA_HOME/templates"
export XDG_DOWNLOAD_DIR="$HOME/dl"
# Documents
export XDG_DOCUMENTS_DIR="$HOME/dc"
export RICE_NOTES_DIR="$XDG_DOCUMENTS_DIR/notes"
# Media
export XDG_MUSIC_DIR="$RICE_MEDIA_DIR/music"
export XDG_VIDEOS_DIR="$RICE_MEDIA_DIR/vid"
export RICE_ANIME_DIR="$RICE_MEDIA_DIR/anime"
export RICE_ARTICLES_DIR="$RICE_MEDIA_DIR/article"
export RICE_GAMES_DIR="$RICE_MEDIA_DIR/game"
export RICE_LIBRARY_DIR="$RICE_MEDIA_DIR/lib"
# Images
export XDG_PICTURES_DIR="$RICE_MEDIA_DIR/pic"
export RICE_SCREENSHOT_DIR="$XDG_PICTURES_DIR/screen"
export RICE_WALLPAPER_DIR="$XDG_PICTURES_DIR/wall"
# Code
export RICE_CODE_DIR="$HOME/cd"
export RICE_REPOSITORY_DIR="$HOME/rp"

# Help files TODO
export BRAVE_HELP_FILE="$XDG_CONFIG_HOME/brave/help.mdox"
export MUTT_HELP_FILE="$XDG_CONFIG_HOME/mutt/help.mdox"
export NVIM_HELP_FILE="$XDG_CONFIG_HOME/nvim/help.mdox"
export RICE_HELP_DIR="$RICE_NOTES_DIR/help"
export RICE_TASKS_DIR="$RICE_NOTES_DIR/tasks"
export RICE_TASK_FILE="$RICE_TASKS_DIR/rice.mdox"
export SYSTEM_HELP_FILE="$RICE_REPOSITORY_DIR/dwm/help.mdox"
export VIFM_HELP_FILE="$XDG_CONFIG_HOME/vifm/help.mdox"
export ZATHURA_HELP_FILE="$XDG_CONFIG_HOME/zathura/help.mdox"
export ZSH_HELP_FILE="$XDG_CONFIG_HOME/zsh/help.mdox"

# Cleanup $HOME
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$HOME/.local/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pyrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec nvidia-xrun
