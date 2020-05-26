#!/bin/sh

# This script is executed automatically when you run startx.

# Start daemons and other in .xprofile.
. ~/.xprofile

# Start WM.
exec dwm
