#! /bin/sh

# .xinitrc is executed automatically when you run startx.

# Start daemons and other in .xprofile.
. ~/.xprofile

# Start WM.
exec herbstluftwm
