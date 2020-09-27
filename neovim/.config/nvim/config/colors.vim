" bold line when in insert mode
autocmd InsertEnter * highlight	CursorLine cterm=bold
autocmd InsertLeave * highlight	CursorLine cterm=none


" augroup coloring
" 	autocmd BufEnter,WinEnter * hi StatusLine		ctermfg=47	ctermbg=232 	cterm=bold
" 	autocmd BufLeave,WinLeave * hi StatusLine		ctermfg=35	ctermbg=none 	cterm=none
" augroup END


hi ColorColumn											ctermbg=235
hi Comment					ctermfg=238
hi CursorLine												ctermbg=none	cterm=none			
hi CursorLineNR			ctermfg=51										cterm=bold
hi DiffAdd													ctermbg=88
hi DiffChange												ctermbg=90
hi DiffDelete				ctermfg=0				ctermbg=213
hi DiffText													ctermbg=199
hi Directory				ctermfg=9
hi EndOfBuffer			ctermfg=0
hi FoldColumn												ctermbg=none
hi Folded						ctermfg=238			ctermbg=16
hi IncSearch				ctermfg=16			ctermbg=255		cterm=bold			
hi LineNr						ctermfg=238
hi MatchParen												ctermbg=none	cterm=bold,underline,italic
hi NonText					ctermfg=238
hi Pmenu						ctermfg=247			ctermbg=232			
hi PmenuSbar				ctermfg=247			ctermbg=232			
hi PmenuSel					ctermfg=48			ctermbg=237		cterm=bold
hi PmenuThumb												ctermbg=235
hi PreProc					ctermfg=83
hi Search						ctermfg=16			ctermbg=51			
hi SignColumn												ctermbg=none
hi Special					ctermfg=92
hi SpecialKey				ctermfg=238
hi StatusLine				ctermfg=47			ctermbg=16	 	cterm=bold
hi StatusLineNC			ctermfg=35			ctermbg=none 	cterm=none
hi TabLine					ctermfg=45			ctermbg=none	cterm=none 
hi TabLineFill											ctermbg=none	cterm=none
hi TabLineSel				ctermfg=49			ctermbg=232
hi Title						ctermfg=99
hi Todo							ctermbg=234										cterm=bold
hi Type							ctermfg=51
hi VertSplit				ctermfg=16
hi VimOption				ctermfg=47
hi Visual						ctermfg=255			ctermbg=240

" git-gutter plugin
hi GitGutterAdd			ctermfg=51			ctermbg=none	cterm=bold		
hi GitGutterChange	ctermfg=48			ctermbg=none	cterm=bold		
hi GitGutterDelete	ctermfg=56			ctermbg=none	cterm=bold		

" sneak plugin
highlight Sneak			 	ctermfg=0			ctermbg=48
highlight SneakLabel 	ctermfg=0			ctermbg=48
" highlight SneakScope 				ctermfg=none	ctermbg=50

" sandwich plugin
highlight OperatorSandwichAdd			ctermfg=0			ctermbg=48								
highlight OperatorSandwichChange								ctermbg=234		cterm=bold
highlight OperatorSandwichDelete															cterm=reverse
