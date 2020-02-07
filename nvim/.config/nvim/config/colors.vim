hi ColorColumn      ctermbg=235
hi Comment          ctermfg=238
hi CursorLine       cterm=none ctermbg=232
hi CursorLineNR     cterm=bold  ctermfg=202
hi Directory        ctermfg=9
hi Folded           ctermfg=238 ctermbg=16
hi LineNr           ctermfg=238
hi NonText          ctermfg=238
hi Pmenu            ctermbg=240     ctermfg=16
hi PmenuSbar        ctermbg=240     ctermfg=16
hi PmenuSel         ctermfg=202     ctermbg=237     cterm=bold
hi PmenuThumb       ctermbg=235
hi PreProc          ctermfg=208
hi Search           ctermbg=9   ctermfg=16
hi SignColumn       ctermbg=232
hi SpecialKey       ctermfg=238
hi StatusLine       ctermfg=9
hi StatusLineNC     ctermfg=234 ctermbg=9
hi TabLineFill      ctermfg=234
hi Type         ctermfg=202
hi VertSplit        ctermfg=16
hi VimOption        ctermfg=203
hi Visual       ctermbg=215
hi Todo             cterm=bold  ctermbg=234
hi MatchParen       cterm=bold,italic  ctermbg=232

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine cterm=bold 

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=232
