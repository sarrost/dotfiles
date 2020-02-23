#!/bin/zsh

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

color_gray=240
color_lightgray=249
color_ao=35
color_brightao=47

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
# double-quoted arguments ("foo")
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$color_ao"
# single-quoted arguments ("foo")
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$color_brightao"
# backtick command substitution (`foo`)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=red"
# single-hyphen options (-o)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$color_lightgray"
# double-hyphen options (--option)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$color_lightgray"
