let mapleader=" "
set cursorline
set expandtab			" spaces rule the world now
set foldmethod=indent 		" also auto folds file
set hidden
set listchars=eol:¬,tab:⊢\ ,space:·,trail:⊚,nbsp:␣,precedes:«,extends:»
set number	" line numbers
set numberwidth=6
set relativenumber
set scrolloff=10
set shiftwidth=4
set switchbuf=usetab
set tabstop=4			" display tabs as 4 spaces
set textwidth=80
set wildmenu	" completion in status line
set incsearch

""" neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')


""" indentLine
let g:indentLine_bgcolor_term = 16
let g:indentLine_enabled = 1	" hide tabs by default


""" command-t
let g:CommandTMaxFiles=100000000000
"let g:CommandTAcceptSelectionSplitMap=['<M-s>']
"let g:CommandTAcceptSelectionVSplitMap=['<M-v>']
let g:CommandTFileScanner='find'


""" NERDTree
let g:NERDTreeWinsize=40
" remove ? reminder
let g:NERDTreeMinimalUI=1
" let space space ^# return from nerdtree window
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
"nmap <buffer> <expr> - g:NERDTreeMapUpdir
let NERDTreeMapUpdir='-'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" auto resize windows when vim is resized
" counteracts psuedo-fullscreen
augroup MyAutocmds
	autocmd!
	autocmd VimResized * execute "normal! \<c-w>="
augroup END


""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


""" LanguageClient
" (fzf) required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'tex': ['/usr/bin/texlab'],
    \ }

""" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><c-j> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<TAB>"
