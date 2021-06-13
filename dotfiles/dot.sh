#!/bin/sh

#〖愛〗dot.sh - dotfile management

# REQUIRED: stow

# TODO: 
#   - support other distros/platforms

help_msg() {
	echo "Usage:
    ./dot.sh [OPTIONS] dir
  Options:
    -I,--install [program] --  install program
    -i,--deploy [program]  --  deploy dotfiles
    -r,--recall [program]  --  recall dotfiles
    -R,--uninstall [program]  -- uninstall program
    -s,--silent            --  silent output
    -v,--verbose           --  verbose output
    -h,--help              --  print this help message

    Option -i is assumed if no options are given.

    Prepend directory with 'sys-' (e.g. sys-portage) to
    deploy/recall system-wide (e.g. /etc/portage/).
    
    Need to run as root when using -I and -R. Running
    -i and -r as root deploys/recalls dotfiles to/from
    /root/. Recalling leaves behind empty folders.
  "
	exit
}

# Update as necessary
get_package() {
	case "${arg_program}" in
		compton) p="x11-misc/compton" ;;
		dunst) p="x11-misc/dunst" ;;
		neovim) p="app-editors/neovim"
			p="$p dev-python/neovim-remote"
			p="$p app-vim/gentoo-syntax" ;;
		task) p="app-misc/task" ;;
		test) p="app-editors/nano" ;;
		vifm) p="app-misc/vifm" ;;
		vim) p="app-editors/vim" ;;
		zsh) p="app-shells/zsh" ;;
	esac
	echo "$p"
}

# Update as necessary
custom_install() {
	case "${arg_program}" in
		neovim) echo "Doing custom install";;
		test) echo "Doing custom install";;
	esac
}

err_no_program() { printf "Error: no program specified.\\n" && exit 1 ; }
err_no_stow() { printf "Error: stow command not found. Install stow to continue.\\n" && exit 1 ; }
err_conflict() { printf "Error: conflicting actions.\\n" && exit 1 ; }

deploy() {
	stow --no-folding --restow -t "${TARGET_DIR}" "${arg_program}"
	[ -z "${bool_verbose}" ] || printf "Deployed: %s\\n" "${arg_program}"
}

install() {
	# Install packages from package manager
	packages="$(get_package)"
	cmd="emerge -q ${packages}"
	[ -z "${BOOL_SILENT}" ] || cmd="${cmd} &>/dev/null"
	[ -z "${packages}" ] || eval "${cmd}"
	# Install using custom cmd
	cmd='custom_install'
	[ -z "${BOOL_SILENT}" ] || cmd="$cmd &>/dev/null"
	eval "${cmd}"
	[ -z "${bool_verbose}" ] || printf "Installed: %s\\n" "${arg_program}"
}

recall() {
	stow --delete -t "${TARGET_DIR}" "${arg_program}"
	[ -z "${bool_verbose}" ] || printf "Recalled: %s\\n" "${arg_program}"
}

uninstall() {
	packages="$(get_package "${arg_program}")"
	cmd="emerge --deselect -q ${packages}"
	[ -z "${BOOL_SILENT}" ] || cmd="${cmd} &>/dev/null"
	[ -z "${packages}" ] || eval "${cmd}"
	[ -z "${bool_verbose}" ] || printf "Uninstalled: %s\\n" "${arg_program}"
}

# Process Args
if OPTS=$(getopt -o IirRsvh \
-l install-deploy,deploy,recall,uninstall-recall,silent,verbose,help \
-n 'parse-options' -- "$@"); then
	echo "Failed parsing options." >&2
	exit 1
fi

eval set -- "${OPTS}"

while true; do
	case "$1" in
		-I | --install-deploy ) BOOL_INSTALL=true; shift ;;
		-i | --deploy ) bool_deploy=true; shift ;;
		-r | --recall ) BOOL_RECALL=true; shift ;;
		-R | --uninstall-recall ) bool_uninstall=true; shift ;;
		-s | --silent ) BOOL_SILENT=true; shift ;;
		-v | --verbose ) bool_verbose=true; shift ;;
		-h | --help ) BOOL_HELP=true; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

# Print help and exit
[ -n "${BOOL_HELP}" ] && help_msg

# Check if stow is installed
command -v stow >/dev/null 2>&1 || err_no_stow

# Exit if no program arg is given
[ -z "$1" ] && err_no_program
arg_program="$1"

# Determine target dir
case "${arg_program}" in
	sys-*) TARGET_DIR=/ ;;
	*) TARGET_DIR="${HOME}" ;;
esac

# Cannot deploy/install and recall/uninstall
{ [ -n "${BOOL_INSTALL}" ] || [ -n "${bool_deploy}" ]; } && 
	{ [ -n "${bool_uninstall}" ] || [ -n "${BOOL_RECALL}" ]; } && 
	err_conflict

# Main job
if [ -n "${BOOL_INSTALL}" ]; then
	install
elif [ -n "${bool_uninstall}" ]; then
	uninstall
elif [ -n "${BOOL_RECALL}" ]; then
	recall
else
	deploy
fi
