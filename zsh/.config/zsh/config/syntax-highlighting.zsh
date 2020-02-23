#!/bin/zsh

# This script enables zsh-syntax-highlighting and configures
# colors for it. must have 256 (4-bit) colors enabled. The
# quality of the end result depends on the terminal theme,
# that is, colors 0-15.
# 
# See: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# for more details.

# Load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# define some custom colors
color_ao=35
color_brightao=47
color_gray=240
color_lightgray=249
color_brightcyan=157
color_lightblue=123

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# unknown tokens / errors
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$color_gray,bold"

# aliases
ZSH_HIGHLIGHT_STYLES[alias]="fg=blue,bold"

# shell builtin commands (shift, pwd, zstyle)
ZSH_HIGHLIGHT_STYLES[builtin]="fg=blue,bold"

# function names
ZSH_HIGHLIGHT_STYLES[function]="fg=blue,bold"

# existing filenames
ZSH_HIGHLIGHT_STYLES[path]="fg=cyan,underline"

# precommand modifiers (e.g., noglob, builtin)
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$color_lightgray,bold"

# command names
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan,bold"

# globbing expressions (*.txt)
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$color_brightao,bold"

# command substitution delimeters ( $() , `` )
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=$color_gray"

#process substitution delimiters (<( and ))
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$color_gray"

# quoted arguments ("foo", 'foo', $'foo')
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$color_ao"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$color_brightao"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=$color_gray"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$color_lightblue"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=$color_gray"

# hyphen options (-o, --option)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$color_lightgray"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$color_lightgray"

# parameter assignments (x=foo and x=( ))
ZSH_HIGHLIGHT_STYLES[assign]="fg=$color_lightgray"

# redirection operators (<, >, etc)
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$color_lightgray"

# comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
ZSH_HIGHLIGHT_STYLES[comment]="fg=$color_gray"

# parameter expansion inside quotes ($foo inside "")
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$color_brightcyan"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$color_brightcyan"
