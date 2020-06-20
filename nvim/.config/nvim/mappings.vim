" map C-i back to C-i
map <F13> <C-i>


"""					Vim-lsp
nnoremap <silent> ]n :LspNextDiagnostic<CR>
nnoremap <silent> [n :LspPreviousDiagnostic<CR>
nnoremap <silent> \ld :LspDocumentDiagnostics<CR>
nnoremap <silent> \ls :LspDocumentSymbol<CR>
nnoremap <silent> >d :LspDefinition<CR>
nnoremap <silent> >D :LspDeclaration<CR>
nnoremap <silent> <d :LspPeekDefinition<CR>
nnoremap <silent> <D :LspPeekDeclaration<CR>


"""					IndentLines
" Toggle indent lines
nnoremap <silent> \<tab> :IndentLinesToggle<CR>


""""""					Copy pasta (registers, clipboard, etc.)
"""				 Yoink
" Change yank history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
" Change paste
nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
" Remaps
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)


"""				 Subversive
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" substitute <motion1> over <motion1> with <input>.
nmap <C-s> <plug>(SubversiveSubstituteRange)
xmap <C-s> <plug>(SubversiveSubstituteRange)


""""""					Easier reading
"""					Limelight
nnoremap \li :Limelight!!<CR>:echo "Toggle limelight"<CR>

"""					Goyo
nnoremap \go :Goyo<CR>


""""""					Editing
"""					auto-pairs
let g:AutoPairsShortcutToggle = '\ap'

"""					Macrobatics
" Play/record macros
nmap <silent> <M-q> <plug>(Mac_Play)
nmap <C-q> <plug>(Mac_RecordNew)
" Rotate macro history
nmap [q <plug>(Mac_RotateBack)
nmap ]q <plug>(Mac_RotateForward)
" Append/prepend to macro
nmap >q <plug>(Mac_Append)
nmap <q <plug>(Mac_Prepend)
" Store macro in register
nmap <M-Q> <plug>(Mac_StoreCurrent)
" List macros
nmap \q :Macros<CR>


""""""					Eye candy
"""					git-gutter
nnoremap <silent> \gu :GitGutterToggle<CR>:echo "Toggle git gutter!"<CR>


""""""					File browsing
"""				 FZF
function! FilesGit()
		let l:isGit = strlen(system("git rev-parse --is-inside-work-tree 2>/dev/null"))
		execute l:isGit > 0 ? 'GFiles': 'Files %:p:h'
endfunction

nnoremap <silent> '' :call FilesGit()<CR>
nnoremap <silent> 'g :Rg<CR>
nnoremap <silent> 'b :Buffers<CR>
nnoremap <silent> 'l :Lines<CR>
nnoremap <silent> 'm :Marks<CR>
nnoremap <silent> 'n :Files $RICE_NOTES_DIR<CR>
nnoremap <silent> 's :Files $XDG_CONFIG_HOME/cf<CR>
nnoremap <silent> 'h :Help<CR>

"""					Vifm
nnoremap <silent> - :Vifm<CR>


""""""					Misc
"""				 Eunuch
nnoremap \sw :SudoWrite<CR>:echo "'" . expand('%:f') . "', sudo written"<CR>

"""				 Fugitive
nnoremap \ga :Gadd<CR>
nnoremap \gb :Gblame<CR>
nnoremap \gc :Gcommit<CR>
nnoremap \gf :Gfetch<CR>
nnoremap \gm :Gmerge<CR>
nnoremap \gp :Gpull<CR>
nnoremap <silent> \gP :Gpush<CR>:echo "Git push done!"<CR>
nnoremap <silent> \gg :Gstatus<CR>


""""""					Searching



""""""					Vanilla vim
" quicker cmds
nnoremap ; :

"make this actually useful
nnoremap Y y$

" Move entire line
nnoremap <down> ddp
nnoremap <up> ddkP
" Move single char
nnoremap <left> xhP
nnoremap <right> xp

" move between windows
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" move window
nnoremap <C-W>h <C-W>H
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L

" open file under cursor
nnoremap <C-g> :vsplit gf<CR>

nnoremap <silent><leader>n :noh<CR>

" fullscreen buffer
nnoremap <M-`> :only<CR>

" Open line in normal mode.
nnoremap <M-O> O<ESC>
nnoremap <M-o> o<ESC>

" Center on movement.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap G Gzz
" center search result.
noremap <plug>(slash-after) zz

" clear registers
function! ClearRegs()
		let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
		for r in regs
				call setreg(r, [])
		endfor
		echo 'Registers cleared.'
endfunction
nnoremap <silent> \cr :call ClearRegs()<CR>

" reload nvim
nnoremap <silent> \re :source ~/.config/nvim/init.vim<CR>:edit<CR>:echo '(N)vim reloaded'<CR>

" toggle spell-checking
nnoremap <silent> \sp :set spell!<CR>:echo "Toggle spelling"<CR>

" kill trailing whitespace on save
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
nnoremap <silent> <leader>ws :call StripTrailingWhitespaces()<CR>:echo "'" . expand('%:f') . "' stripped of all trailing whitespace"<CR>

" toggle hidden characters
nnoremap <silent> \hi :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<CR>:echo 'Toggle hidden characters.'<CR>



nnoremap <silent> <space><space> /<\~\~><CR>:noh<CR>4xa
