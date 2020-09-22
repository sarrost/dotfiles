" enable label mode
let g:sneak#label = 1
" case sensitivity determined by ignorcase and smartcase
let g:sneak#use_ic_scs = 1

" sneak motion
nmap x <Plug>Sneak_s
nmap X <Plug>Sneak_S
" visual-mode
xmap x <Plug>Sneak_s
xmap X <Plug>Sneak_S
" operator-pending-mode
omap x <Plug>Sneak_s
omap X <Plug>Sneak_S

" replace with 1-letter sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
