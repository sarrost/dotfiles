#!/bin/sh

#〖愛〗dot.sh - dotfile management

# REQUIRED: stow

# TODO: 
#   - system dotfiles 
#   - support other distros/platforms

REPOS_DIR="${RICE_WORLD_REPO_DIR}"

help_msg() {
	echo "Usage:
    tag [OPTIONS] file
  Note:
    Option -i is assumed if no options are given.
  Options:
    -I,--install [program] --  install program
    -i,--deploy [program]  --  deploy dotfiles
    -r,--recall [program]  --  recall dotfiles
    -R,--uninstall [program]  -- uninstall program
    -s,--silent            --  silent output
    -v,--verbose           --  verbose output
    -h,--help              --  print this help message
  Note:
    Need to run as root when using -I and -R. Running
    -i and -r as root deploys/recalls dotfiles to/from
    /root/. Recalling leaves behind empty folders.
  "
	exit
}

# Update as necessary
get_package() {
	case "$ARG_PROGRAM" in
		compton) echo "x11-misc/compton" ;;
		dunst) echo "x11-misc/dunst" ;;
		neovim) echo "app-editors/neovim dev-python/neovim-remote" ;;
		task) echo "app-misc/task" ;;
		test) echo "app-editors/nano" ;;
		vifm) echo "app-misc/vifm" ;;
		vim) echo "app-editors/vim" ;;
		zsh) echo "app-shells/zsh" ;;
	esac
}

# Update as necessary
custom_install() {
	case "$ARG_PROGRAM" in
		neovim) echo "Doing custom install";;
		test) echo "Doing custom install";;
	esac
}

err_no_program() { printf "Error: no program specified.\n" && exit 1 ; }
err_no_stow() { printf "Error: stow command not found. Install stow to continue.\n" && exit 1 ; }
err_conflict() { printf "Error: conflicting actions.\n" && exit 1 ; }

deploy() {
	stow --no-folding --restow -t "$HOME" "$ARG_PROGRAM"
	[ -z "$BOOL_VERBOSE" ] || printf "Deployed: $ARG_PROGRAM\n"
}

install() {
	# Install packages from package manager
	PACKAGES="$(get_package)"
	cmd='emerge -q "$PACKAGES"'
	[ -z "$BOOL_SILENT" ] || cmd="$cmd &>/dev/null"
	[ -z "$PACKAGES" ] || eval "$cmd"
	# Install using custom cmd
	cmd='custom_install'
	[ -z "$BOOL_SILENT" ] || cmd="$cmd &>/dev/null"
	eval "$cmd"
	[ -z "$BOOL_VERBOSE" ] || printf "Installed: $ARG_PROGRAM\n"
}

recall() {
	stow --delete -t "$HOME" "$ARG_PROGRAM"
	[ -z "$BOOL_VERBOSE" ] || printf "Recalled: $ARG_PROGRAM\n"
}

uninstall() {
	PACKAGES="$(get_package "$ARG_PROGRAM")"
	cmd='emerge --deselect -q "$PACKAGES"'
	[ -z "$BOOL_SILENT" ] || cmd="$cmd &>/dev/null"
	[ -z "$PACKAGES" ] || eval "$cmd"
	[ -z "$BOOL_VERBOSE" ] || printf "Uninstalled: $ARG_PROGRAM\n"
}

# Process Args
OPTS=$(getopt -o IirRsvh \
-l install-deploy,deploy,recall,uninstall-recall,silent,verbose,help \
-n 'parse-options' -- "$@")

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

while true; do
	case "$1" in
		-I | --install-deploy ) BOOL_INSTALL=true; shift ;;
		-i | --deploy ) BOOL_DEPLOY=true; shift ;;
		-r | --recall ) BOOL_RECALL=true; shift ;;
		-R | --uninstall-recall ) BOOL_UNINSTALL=true; shift ;;
		-s | --silent ) BOOL_SILENT=true; shift ;;
		-v | --verbose ) BOOL_VERBOSE=true; shift ;;
		-h | --help ) BOOL_HELP=true; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

# Print help and exit
[ ! -z "$BOOL_HELP" ] && help_msg

# Check if stow is installed
command -v stow &>/dev/null || err_no_stow

# Exit if no program arg is given
[ -z "$1" ] && err_no_program
ARG_PROGRAM="$1"

# Cannot deploy/install and recall/uninstall
([ ! -z "$BOOL_INSTALL" ] || [ ! -z "$BOOL_DEPLOY" ]) && ([ ! -z "$BOOL_UNINSTALL" ] || [ ! -z "$BOOL_RECALL" ]) && err_conflict

# Main job
if [ ! -z "$BOOL_INSTALL" ]; then
	install
elif [ ! -z "$BOOL_UNINSTALL" ]; then
	uninstall
elif [ ! -z "$BOOL_RECALL" ]; then
	recall
else
	deploy
fi
