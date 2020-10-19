#〖愛〗Profile configuration file.

# This file is automatically run upon login--before the
# graphical server is started. Set global environmental 
# variables here.

add_to_path() {
	export PATH="$PATH:$(du -L "$1" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
}
add_to_path "$HOME/.local/bin"
#add_to_path "$HOME/.local/go/bin"
#add_to_path '/opt/resolver/bin'

# Programs
export BROWSER="firefox"
export EDITOR="nvim"
export FILE_BROWSER="vifm"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export READER="zathura"
export STATUSBAR="dwmblocks"
#export SUDO_ASKPASS="dmenupass"
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
export RICE_NOTES_DIR="$XDG_DOCUMENTS_DIR/notes"
export RICE_NOTES_FILE="$RICE_NOTES_DIR/scratch.mdox"
# Media
export XDG_MUSIC_DIR="$RICE_MEDIA_DIR/ms"
export XDG_VIDEOS_DIR="$RICE_MEDIA_DIR/vd"
export RICE_ANIME_DIR="$RICE_MEDIA_DIR/an"
export RICE_ARTICLES_DIR="$RICE_MEDIA_DIR/article"
export RICE_GAMES_DIR="$RICE_MEDIA_DIR/game"
export RICE_LIBRARY_DIR="$RICE_MEDIA_DIR/lib"
# Images
export XDG_PICTURES_DIR="$RICE_MEDIA_DIR/pc"
export RICE_SCREENSHOT_DIR="$XDG_PICTURES_DIR/sc"
export RICE_WALLPAPER_DIR="$XDG_PICTURES_DIR/wp"

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

## Cleanup $HOME
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug 
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export TASKDATA="$XDG_DATA_HOME/task"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}
export VIMINIT='if !has('\'nvim\'') | source $XDG_CONFIG_HOME/vim/vimrc | else | source $XDG_CONFIG_HOME/nvim/init.vim | endif' 
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export mbsyncrc="$XDG_CONFIG_HOME"/isync/mbsyncrc

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
# remapkeys
