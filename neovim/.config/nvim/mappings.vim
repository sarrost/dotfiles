"〖愛〗Neovim mappings file.

" Put all non-plugin related mappings here.

" My suckless terminal build remaps specific keys onto new
" keys. Map these keys back to their original keys.
nnoremap <F13> <C-i>
nnoremap <F13> <C-[>

" make this actually useful
nnoremap Y y$

" write file as root
nnoremap \ww :w !doas tee %<CR>:echo "'" . expand('%:f') . "', written as root"<CR>
" reload nvim
nnoremap <silent> \re :source ~/.config/nvim/init.vim<CR>:edit<CR>:echo '(N)vim reloaded'<CR>
" clear search highligting
nnoremap <silent> <space>n :noh<CR>
" fullscreen buffer
nnoremap <silent> <M-`> :only<CR>

" kill trailing whitespace
function! StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunction
nnoremap <silent> <space>ws :call StripTrailingWhitespaces()<CR>:echo "'" . expand('%:f') . "' stripped of all trailing whitespace"<CR>

" toggle hidden characters
nnoremap <silent> <M-C-H> :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<CR>

" toggle color column
nnoremap <silent> <M-S-Bar> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60,80,100,120" : "")<CR>


""""					Vim-lsp
"nnoremap <silent> ]n :LspNextDiagnostic<CR>
"nnoremap <silent> [n :LspPreviousDiagnostic<CR>
"nnoremap <silent> \ld :LspDocumentDiagnostics<CR>
"nnoremap <silent> \ls :LspDocumentSymbol<CR>
"nnoremap <silent> >d :LspDefinition<CR>
"nnoremap <silent> >D :LspDeclaration<CR>
"nnoremap <silent> <d :LspPeekDefinition<CR>
"nnoremap <silent> <D :LspPeekDeclaration<CR>
"
"
""""					IndentLines
"" Toggle indent lines
"nnoremap <silent> \<tab> :IndentLinesToggle<CR>

"""""""					Editing
""""					auto-pairs
"let g:AutoPairsShortcutToggle = '\ap'
"
""""					Macrobatics
"" Play/record macros
"nmap <silent> <M-q> <plug>(Mac_Play)
"nmap <C-q> <plug>(Mac_RecordNew)
"" Rotate macro history
"nmap [q <plug>(Mac_RotateBack)
"nmap ]q <plug>(Mac_RotateForward)
"" Append/prepend to macro
"nmap >q <plug>(Mac_Append)
"nmap <q <plug>(Mac_Prepend)
"" Store macro in register
"nmap <M-Q> <plug>(Mac_StoreCurrent)
"" List macros
"nmap \q :Macros<CR>
"
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	MISCELLANEOUS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" clear registers
"function! ClearRegs()
"		let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
"		for r in regs
"				call setreg(r, [])
"		endfor
"		echo 'Registers cleared.'
"endfunction
"nnoremap <silent> \cr :call ClearRegs()<CR>


"" toggle spell-checking
"nnoremap <silent> \sp :set spell!<CR>:echo "Toggle spelling"<CR>


"nnoremap <silent> <space><space> /<\~\~><CR>:noh<CR>4xa
"
"nnoremap <space>gn :read !gennumseq<space>
