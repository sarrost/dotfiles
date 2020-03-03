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
"""				 Limelight
nnoremap \li :Limelight!!<CR>:echo "Toggle limelight"<CR>


""""""					Editing


""""""					Eye candy


""""""					File browsing
"""				 FZF
function! FilesGit()
		let l:isGit = strlen(system("git rev-parse --is-inside-work-tree 2>/dev/null"))
		execute l:isGit > 0 ? 'GFiles': 'Files %:p:h'
endfunction

nnoremap <silent> '' :call FilesGit()<CR>
nnoremap <silent> 'g :Rg<CR>
nnoremap <silent> '; :Buffers<CR>
nnoremap <silent> 'd :Files ~/dotfiles<CR>
nnoremap <silent> 'l :Lines<CR>
nnoremap <silent> 'm :Marks<CR>
nnoremap <silent> 'n :Files ~/Documents/notes<CR>
nnoremap <silent> 's :Files ~/.scripts<CR>


""""""					Misc
"""				 Eunuch
nnoremap \sw :SudoWrite<CR>

"""				 Fugitive
nnoremap \ga :Gadd<CR>
nnoremap \gb :Gblame<CR>
nnoremap \gc :Gcommit<CR>
nnoremap \gf :Gfetch<CR>
nnoremap \gm :Gmerge<CR>
nnoremap \gp :Gpull<CR>
nnoremap \gP :Gpush<CR>
nnoremap \gs :Gstatus<CR>
nnoremap \gg :Gstatus<CR>


""""""					Searching


""""""					Syntax highlighters


""""""					~Custom
""" Arrows
" Move entire line
nnoremap <down> ddp
nnoremap <up> ddkP
" Move single char
nnoremap <left> xhP
nnoremap <right> xp

""" alpha
" open file under cursor
nnoremap <C-g> :vsplit gf<CR>
" git
nnoremap <M-g> :G<CR>
" help menu
"nnoremap <M-H> :CommandTHelp<CR>
" search in file
"nnoremap <M-L> :CommandTLine<CR>

nnoremap <M-m> :Move
nnoremap <M-M> :Startify<CR>
""" Toggle NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" command-t
"nnoremap <M-o> :CommandTMRU<CR>
nnoremap <silent><leader>n :noh<CR>
" shell
"nnoremap <leader>ri :RunInInteractiveShell<space>
" rotate windows
nnoremap <M-r> <C-W>r
nnoremap <M-R> <C-W>R
" substitute
"nmap <leader>S <Plug>(FerretAcks)
" horizontal splits
nnoremap <M-s> :split<CR>
nnoremap <M-S> :new<CR>
" vertical splits
nnoremap <M-v> :vsplit<CR>
nnoremap <M-V> :vnew<CR>
" exchange window
nnoremap <M-x> <C-W>x
" write
nnoremap <leader>w :saveas

""" misc
" fullscreen buffer
nnoremap <M-`> :only<CR>
" equal size windows
nnoremap <M-=> <C-W>=
" vertical maximize
nnoremap <M--> <C-W><bar>
" maximize
nnoremap <M-+> <C-W>_<C-W><bar>
" horizontal maximize
nnoremap <M-_> <C-W>_
" quicker command-t
"nnoremap : :CommandTCommand<CR>
" quicker cmds
nnoremap ; :

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
nnoremap <silent> \re :source ~/.config/nvim/init.vim<CR>:echo '(N)vim reloaded'<CR>

" toggle hidden characters
nnoremap <silent> \hi :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<CR>:echo 'Toggle hidden characters.'<CR>





" make this actually useful
nnoremap Y y$



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

""" auto-pairs
let g:AutoPairsShortcutToggle = '\ap'


nnoremap \sp :set spell!<CR>


"""					git-gutter
nnoremap <silent> \gu :GitGutterToggle<CR>:echo "Toggle git gutter!"<CR>


" kill trailing whitespace on save
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
nnoremap <silent> <leader>ws :call StripTrailingWhitespaces()<CR>:echo "'" . expand('%:f') . "' stripped of all trailing whitespace"<CR>


"""					Goyo
nnoremap \go :Goyo<CR>
