autocmd BufWritePost ~/rp/dwm/src/config.h !cd ~/rp/dwm/src; sudo make install && pkill -1 dwm 
autocmd BufWritePost ~/rp/dwmblocks/src/blocks.h !cd ~/rp/dwmblocks/src; sudo make install && { killall -q dwmblocks; setsid dwmblocks & }


autocmd BufWritePost ~/.config/genshortcuts/dirsrc !genshortcuts
autocmd BufWritePost ~/dt/genshortcuts/.config/genshortcuts/dirsrc !genshortcuts
