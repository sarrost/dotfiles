#!/bin/sh

# TODO: root dot files

help_msg() {
	echo "Usage:
		tag [OPTIONS] file
	Options:
		-I,--install-deploy [program]
		       --  install program and deploy dotfiles
		-i,--deploy [program]  --  deploy dotfiles
		-r,--recall [program]  --  recall dotfiles
		-R,--uninstall-recall [program]
		       --  uninstall program and recall dotfiles
		-s,--silent            --  silent output
		-v,--verbose           --  verbose output
		-h,--help              --  print this help message
	"
	exit
}

err_no_program() {
	printf "Error: no program specified.\n" && exit 1
}

err_conflict() {
	printf "Error: conflicting actions.\n" && exit 1
}


deploy() {
	stow --no-folding --restow -t $HOME "$ARG_PROGRAM"
}

get_portage() {
	case "$1" in
		compton) echo "x11-misc/compton" ;;
		vim) echo "app-editors/vim" ;;
		vifm) echo "app-misc/vifm" ;;
	esac
}
install() {
	PACKAGES="$(get_portage "$ARG_PROGRAM")"
	[ -z "$PACKAGES" ] || sudo emerge "$PACKAGES"
}

recall() {
	stow --delete -t $HOME "$ARG_PROGRAM"
}
uninstall() {
	echo "Uninstalling"
}



# PROCESS ARGS
OPTS=$(getopt -o IirRsvh: \
-l install-deploy,deploy,recall,uninstall-recall,silent,verbose,help: \
-n 'parse-options' -- "$@")

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

BOOL_INSTALL_DEPLOY=false
BOOL_DEPLOY=false
BOOL_RECALL=false
BOOL_UNINSTALL_RECALL=false
BOOL_SILENT=false
BOOL_VERBOSE=false
BOOL_HELP=false

while true; do
  case "$1" in
      -I | --install-deploy ) BOOL_INSTALL_DEPLOY=true; shift ;;
      -i | --deploy ) BOOL_DEPLOY=true; shift ;;
      -r | --recall ) BOOL_RECALL=true; shift ;;
      -R | --uninstall-recall ) BOOL_UNINSTALL_RECALL=true; shift ;;
      -s | --silent ) BOOL_SILENT=true; shift ;;
      -v | --verbose ) BOOL_VERBOSE=true; shift ;;
      -h | --help ) BOOL_HELP=true; shift ;;
      -- ) shift; break ;;
      * ) break ;;
  esac
done

# Exit if no program arg is given
[ -z "$1" ] && err_no_program
ARG_PROGRAM="$1"

# Print help and exit
[ "$BOOL_HELP" = "true" ] && help_msg

# Cannot deploy/install and recall/uninstall
([ "$BOOL_INSTALL_DEPLOY" = true ] || [ "$BOOL_DEPLY" = true ]) && ([ "$BOOL_UNINSTALL_REALL" = true ] || [ "$BOOL_RECALL" = true ]) && err_conflict

if [ "$BOOL_INSTALL_DEPLOY" = true ]; then
	install
	deploy
elif [ "$BOOL_UNINSTALL_RECALL" = true ]; then
	uninstall
	recall
elif [ "$BOOL_RECALL" = true ]; then
	recall
else
	deploy
fi
