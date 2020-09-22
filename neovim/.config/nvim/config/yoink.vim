" sync reg 1-9 to reflect recent yanks
let g:yoinkSyncNumberedRegisters = 1

" remap to enable swapping
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
" change paste
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
" change yank history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
" preserve position of cursor after performing a yank
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
