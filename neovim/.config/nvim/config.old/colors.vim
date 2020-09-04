"" Change Color when entering Insert Mode
autocmd InsertEnter * highlight	CursorLine cterm=bold 
"
"" Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight	CursorLine cterm=none ctermbg=16
autocmd InsertLeave * highlight	CursorLine cterm=none

hi ColorColumn			ctermbg=235
hi Comment					ctermfg=238
" hi CursorLine				cterm=none			ctermbg=16
hi CursorLine				cterm=none			ctermbg=none
hi CursorLineNR			cterm=bold			ctermfg=51
hi Directory				ctermfg=9
hi Folded						ctermfg=238			ctermbg=16
hi LineNr						ctermfg=238
hi NonText					ctermfg=238
hi Pmenu						ctermbg=236			ctermfg=16
hi PmenuSbar				ctermbg=236			ctermfg=16
hi PmenuSel					ctermfg=51			ctermbg=237		 cterm=bold
hi PmenuThumb				ctermbg=235
hi PreProc					ctermfg=83
hi Search						ctermbg=51			ctermfg=16
hi IncSearch				cterm=bold			ctermbg=255		 ctermfg=16
hi SignColumn				ctermbg=none
hi TabLineSel				ctermbg=16			ctermfg=14
hi SpecialKey				ctermfg=238
hi StatusLine				ctermfg=232			ctermbg=238
hi StatusLineNC			ctermfg=234			ctermbg=9
hi TabLineFill			ctermfg=234
hi Type							ctermfg=51
hi VertSplit				ctermfg=16
hi VimOption				ctermfg=47
hi Visual						ctermbg=240			ctermfg=255
hi Todo							cterm=bold			ctermbg=234
hi MatchParen				ctermbg=none			cterm=bold,underline,italic
hi Special					ctermfg=92
hi Title						ctermfg=99


""" vim-lsp plugin
hi LspErrorHighlight											ctermbg=none		cterm=bold,italic
hi LspErrorText							ctermfg=35		ctermbg=none    cterm=bold,italic,underline
hi LspWarningHighlight			cterm=italic,bold
hi LspWarningText						ctermfg=237		ctermbg=none    cterm=bold,italic,underline

" PopupWindow
augroup lsp_float_colours
	autocmd!
	autocmd User lsp_float_opened
			\ call nvim_win_set_option(
			\   lsp#ui#vim#output#getpreviewwinid(),
			\   'winhighlight', 'Normal:StatusLine')
augroup end

" git-gutter plugin
hi GitGutterAdd							cterm=bold		ctermfg=51
hi GitGutterChange					cterm=bold		ctermfg=48
hi GitGutterDelete					cterm=bold		ctermfg=56



highlight QuickScopePrimary cterm=underline,bold
highlight QuickScopeSecondary cterm=underline,bold,italic
