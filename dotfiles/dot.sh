#!/bin/sh

#-----------------------------------------------------------
#                          SETUP
#-----------------------------------------------------------
#----------------------- VARIABLES -----------------------#
c=$(printf '\033[0m')
light_red=$(printf '\033[1;31m')  ; red=$(printf '\033[0;31m')
light_cyan=$(printf '\033[1;36m') ; cyan=$(printf '\033[0;36m')

error="${light_red}ERROR ${red}=>${c} "
header="${light_cyan}DOT ${cyan}=>${c} "

#------------------------- ERRORS -------------------------#
err_install() { printf '%s\n' "${error}Cannot install."; exit 1; }
err_recall() { printf '%s\n' "${error}Cannot recall."; exit 1; }
err_conflict() { printf '%s\n' "${error}Conflicting actions."; exit 1 ; }
err_no_configs() { printf '%s\n' "${error}No program specified."; exit 1 ; }
err_no_stow() { printf '%s\n' "${error}Stow command not found. Install stow to continue."; exit 1 ; }

#------------------------ GENERAL ------------------------#
# Print help message and exit
show_help() {
	echo "Usage:
    ./dot.sh [OPTIONS] dir
  Options:
    -i,--install [program]  --  deploy dotfiles
    -r,--recall [program]   --  recall dotfiles
    -h,--help               --  print this help message

    Running -i and -r as root deploys/recalls dotfiles 
    to/from /root/. Recalling leaves behind empty folders.

    Prepend directory with 'sys-' (e.g. sys-portage) to
    deploy/recall system-wide (e.g. /etc/portage/).
  "
	exit
}

# Install dotfiles
install() {
	stow --no-folding --restow -t "$(target_dir "$1")" "$1" || err_install
	printf '%s\n' "${header}Deploy ${cyan}${1}${c}."
}

# Recall dotfiles
recall() {
	stow --delete -t "$(target_dir "$1")" "$1" || err_recall
	printf '%s\n' "${header}Recall ${cyan}${1}${c}."
}

# Determine target directory to use as root for deployment
target_dir() {
	case "$1" in
		sys-*) printf '%s' '/' ;;
		*) printf '%s' "${HOME}" ;;
	esac
}

# Trim whitespace from string
trim() { echo "$1" | sed 's/^\s*//; s/\s*$//'; }

#-----------------------------------------------------------
#                           MAIN
#-----------------------------------------------------------
#------------------------ CLI ARGS ------------------------#
getopt -qQ -o ir: --long help,install,recall: -n 'parse-options' -- "$@" || err_parse_opts 

while true; do
	case "$1" in
		-i | --install ) install_configs="$install_configs $2"; shift; shift ;;
		-r | --recall ) recall_configs="$recall_configs $2"; shift; shift ;;
		--help ) help=1; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

# Print help message.
[ -z "$help" ] || show_help

# Check if stow is installed
command -v stow >/dev/null 2>&1 || err_no_stow

# Fail if no configs specified.
[ -z "$install_configs" ] && [ -z "$recall_configs" ] && err_no_configs

# Fail if attempting to both install and recall.
[ -n "$install_configs" ] && [ -n "$recall_configs" ] && err_conflict

#--------------------- INSTALL/RECALL ---------------------#
if [ -n "$install_configs" ]; then
	install_configs=$(trim "$install_configs")
	for config in $install_configs; do
		install	"$config"
	done
fi

if [ -n "$recall_configs" ]; then
	recall_configs=$(trim "$recall_configs")
	for config in $recall_configs; do
		recall "$config"
	done
fi
