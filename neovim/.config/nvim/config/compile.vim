autocmd BufWritePost $RICE_REPO_DIR/st/src/config.h !cd $RICE_REPO_DIR/st/src; doas make install 
autocmd BufWritePost $RICE_REPO_DIR/dwm/src/config.h !cd $RICE_REPO_DIR/dwm/src; doas make install && pkill -1 dwm 
autocmd BufWritePost $RICE_REPO_DIR/dwmblocks/src/blocks.h !cd $RICE_REPO_DIR/dwmblocks/src; doas make install && { killall -q dwmblocks; setsid dwmblocks & }

autocmd BufWritePost ~/.config/genshortcuts/dirsrc !genshortcuts
autocmd BufWritePost ~/dt/genshortcuts/.config/genshortcuts/dirsrc !genshortcuts
