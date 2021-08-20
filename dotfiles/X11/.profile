#〖愛〗Profile configuration file.

# This file is automatically run upon login--before the
# graphical server is started. Set global environmental 
# variables here.

add_to_path() {
	export PATH="$PATH:$(du -L "$1" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
}
add_to_path "$HOME/.local/bin"

# Programs
export BROWSER="firefox"
export EDITOR="nvim"
export FILE_BROWSER="f"
export VPWD_FILE_BROWSER="source vpwd_lf"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export STATUSBAR='dwmblocks'

export READER="zathura"
export STATUSBAR="dwmblocks"
export TERMINAL="st"

# RICE (treated like XDG dirs, but custom)
export RICE_CODE_DIR="$HOME/cd"
export RICE_REPO_DIR="$RICE_CODE_DIR/local"
export RICE_WORLD_REPO_DIR="$RICE_CODE_DIR/world"
export RICE_SCRIPTS_DIR="$RICE_REPO_DIR/scripts/scripts"
export RICE_DOTFILES_DIR="$RICE_REPO_DIR/dt"
add_to_path "$RICE_SCRIPTS_DIR"
export RICE_MEDIA_DIR="$HOME/md"
export RICE_WORK_DIR="$HOME/wk"
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
export RICE_NOTES_DIR="$XDG_DOCUMENTS_DIR/nt"
export RICE_NOTES_FILE="$RICE_NOTES_DIR/scratch.mdox"
# Media
export XDG_MUSIC_DIR="$RICE_MEDIA_DIR/ms"
export RICE_ANIME_DIR="$RICE_MEDIA_DIR/an"
export RICE_ARTICLES_DIR="$RICE_MEDIA_DIR/article"
export RICE_AUDIO_DIR="$RICE_MEDIA_DIR/au"
export RICE_GAMES_DIR="$RICE_MEDIA_DIR/game"
export RICE_LIBRARY_DIR="$RICE_MEDIA_DIR/li"
export RICE_MOVIE_DIR="$RICE_MEDIA_DIR/mv"
export RICE_TV_DIR="$RICE_MEDIA_DIR/tv"
export RICE_SCREENCAST_DIR="$RICE_MEDIA_DIR/sc"
# Video
export XDG_VIDEOS_DIR="$RICE_MEDIA_DIR/vd"
# Images
export XDG_PICTURES_DIR="$RICE_MEDIA_DIR/pc"
export RICE_SCREENSHOT_DIR="$XDG_PICTURES_DIR/ss"
export RICE_WALLPAPER_DIR="$XDG_PICTURES_DIR/wp"

## Cleanup $HOME
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug 
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export TASKDATA="$XDG_DATA_HOME/task"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}
#export VIMINIT='if !has('\'nvim\'') | source $XDG_CONFIG_HOME/vim/vimrc | else | source $XDG_CONFIG_HOME/nvim/init.vim | endif' 
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONSTARTUP=~/.config/python/pythonrc
export GOPATH="$XDG_DATA_HOME"/go
add_to_path "$GOPATH/bin"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export RICE_CSS_FONTS_DIR="$RICE_REPO_DIR"/css-fonts

# Start graphical server if not already running.
{ [ "$(tty)" = "/dev/tty1" ] || [ "$(tty)" = "/dev/pts/0" ]; } && 
	! pgrep -x dwm >/dev/null && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"

# Run when logout
#trap 'doas prime-switch; exit 0' 0
