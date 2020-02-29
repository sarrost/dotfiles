#!/bin/sh

# This script enables zsh-notify and configures it.

source /usr/share/zsh/plugins/zsh-notify/notify.plugin.zsh 2>/dev/null

zstyle ':notify:*' command-complete-timeout 10
zstyle ':notify:*' error-title "Failed in #{time_elapsed}"
zstyle ':notify:*' success-title "Completed in #{time_elapsed}"
