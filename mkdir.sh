#!/bin/sh

# In many of my configurations I change the locations of
# where certain files are stored. This can sometimes cause
# errors for the relative program if the new locations do
# not exist. This script solves the issue by making new 
# empty directories in advance. Directories which are
# already populated will not be affected.

mkdir -p \
"$XDG_DATA_HOME/mpd/playlists" \
"$XDG_CACHE_HOME/less" \
"$XDG_CONFIG_HOME/pg" \
"$XDG_CACHE_HOME/pg"
