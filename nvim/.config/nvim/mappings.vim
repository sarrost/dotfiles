""""""          Autocompletion
"""         LanguageClient-neovim
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


""""""          Copy pasta (registers, clipboard, etc.)
"""         Yoink
" Change yank history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
" Change paste
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
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


""""""          Easier reading
"""         Limelight
nmap <M-l> <Plug>(Limelight)
xmap <M-l> <Plug>(Limelight)
nnoremap <Leader>l :Limelight!!<CR>


""""""          Editing


""""""          Eye candy


""""""          File browsing
"""         FZF
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


""""""          Misc
"""         Eunuch
nnoremap <leader>sw :SudoWrite<CR>

"""         Fugitive
nnoremap <leader>ga :Gadd<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gg :Gstatus<CR>


""""""          Searching


""""""          Syntax highlighters


""""""          ~Custom
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
nnoremap <silent> <leader>C :call ClearRegs()<CR>

" reload nvim
nnoremap <silent> <leader>R :source ~/.config/nvim/init.vim<CR>:echo '(N)vim reloaded.'<CR>

" toggle hidden characters
nnoremap <silent> <leader>z :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<CR>:echo 'Toggle hidden characters.'<CR>


nnoremap Y y$
