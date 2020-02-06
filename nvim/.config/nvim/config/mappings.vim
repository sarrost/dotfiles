""" arrows
" move entire line
nnoremap <down> ddp
nnoremap <up> ddkP
" move single char
nnoremap <left> xhP
nnoremap <right> xp

""" alpha
" paste here
"nmap cvv cvl
" delete file
"nnoremap <M-e> :CommandT<CR>
" open file under cursor
nnoremap <C-g> :vsplit gf<CR>
" git
nnoremap <M-g> :G<CR>
" move window
nnoremap <C-h> <C-W>H
" move between windows
nnoremap <M-h> <C-W>h
" help menu
"nnoremap <M-H> :CommandTHelp<CR>
"" map C-i back to C-i
nnoremap <F7> <C-i>
" move window
nnoremap <C-j> <C-W>J
" move between windows
nnoremap <M-j> <C-W>j
" move window
nnoremap <C-k> <C-W>K
" move between windows
nnoremap <M-k> <C-W>k
" move window
nnoremap <C-l> <C-W>L
" move between windows
nnoremap <M-l> <C-W>l
" search in file
"nnoremap <M-L> :CommandTLine<CR>

nnoremap <M-m> :Move 
nnoremap <M-M> :Startify<CR>
""" Toggle NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" command-t
"nnoremap <M-o> :CommandTMRU<CR>
nnoremap <leader>n :noh<CR><CR>
" shell
nnoremap <leader>ri :RunInInteractiveShell<space>
" rotate windows
nnoremap <M-r> <C-W>r
nnoremap <M-R> <C-W>R
" reload vim
nnoremap <leader>R :source ~/.vimrc<CR>
" substitute
nmap <leader>S <Plug>(FerretAcks)
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
" toggle hidden characters
nnoremap <leader>z :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>


""" misc
" quick indenting
nnoremap <tab> V>
nnoremap <s-tab> V<
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

" reload nvim
nnoremap <silent> <leader>r :source ~/.config/nvim/init.vim<CR>

" git stuff
nnoremap <leader>ga :Gadd<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gg :Gstatus<CR>


"""         FZF
" fzf `git` repo
nnoremap <leader>ff :GFiles<CR>
" fzf `directory`
nnoremap <leader>fd :Files %:p:h<CR>
" fzf `cmd line`
nnoremap <leader>fc :Files 
" fzf `git` repo
nnoremap <leader>fg :GFiles<CR>
" fzf `git` repo
nnoremap <leader>fb :Buffers<CR>
" fzf `marks`
nnoremap <leader>fm :Marks<CR>
" fzf `scripts`
nnoremap <leader>fs :Files ~/.local/bin/<CR>


nnoremap <leader>sw :SudoWrite<CR>


nnoremap <leader>mp :MarkdownPreview<CR>

" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Open line in normal mode.
nnoremap <M-O> O<ESC>
nnoremap <M-o> o<ESC>

" Center on movement.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz


"""         Yoink
" Change yank history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
" Change paste
nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
" Remaps
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)


"""         Subversive
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" substitute <motion1> over <motion1> with <input>.
nmap <C-s> <plug>(SubversiveSubstituteRange)
xmap <C-s> <plug>(SubversiveSubstituteRange)
