" use surround.vim mappings
nmap ys <Plug>(operator-sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> yss <Plug>(operator-sandwich-add)<SID>line
onoremap <SID>gul g_
nmap yS ys<SID>gul

nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>((textobj-sandwich-query-a))
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

xmap S <Plug>(operator-sandwich-add)

" allow repeatability
runtime autoload/repeat.vim
if hasmapto('<Plug>(RepeatDot)')
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
else
  nmap . <Plug>(operator-sandwich-dot)
endif
