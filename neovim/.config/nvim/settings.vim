"〖愛〗Neovim settings file

" Place all non-plugin related, non-mapping settings, 
" configurations and custom functions here. All .vim
" files in ./config/ are sourced in this file. Mappings
" are sourced at the end of this file.

set clipboard+=unnamedplus		" always use clipboard instead of + and * regs
let g:clipboard = {
	\	'name': 'xsel_override',
	\	'copy': {
	\		'+': 'xsel --input --clipboard',
	\	 	'*': 'xsel --input --primary',
	\	 },
	\	'paste': {
	\		'+': 'xsel --output --clipboard',
	\		'*': 'xsel --output --primary',
	\	},
	\	'cache_enabled': 1,
	\	}
set cmdheight=2								" give more space for displaying messages
set cursorline								" enable hilighting for line with cursor
set diffopt+=vertical,foldcolumn:1						" diff mode options
set fillchars+=vert:\					" hide vertical separator
set hidden										" buffer becomes hidden when abandoned
set ignorecase								" ignorecase when searching
set smartcase									" only consider case when uppercase is used
set incsearch									" move to nearest result while searching
set listchars=eol:¬,space:␣,trail:+,tab:\ ┊		" whitespace characters representations
set number										" show line numbers
set relativenumber						" use relative line numbers
set shiftwidth=0							" default to value of tabstop
set shortmess+=I							" disable startup message
set shortmess+=c							" don't pass messages to ins-completion-menu
set signcolumn=yes						" always show signcolumn
set switchbuf=usetab					" jump to first open window that has buffer
set tabstop=2									" number of spaces a tab counts for
set softtabstop=2
if !isdirectory("/tmp/vim-undo-dir")					" use persistent undo history
    call mkdir("/tmp/vim-undo-dir", "", 0700)
endif
set undodir=/tmp/vim-undo-dir
set undofile
set updatetime=50							" how often swap file is written to disk. also used for some plugin ui updates.
set virtualedit=block					" select rectangles in visual block mode
set wildmenu			            " completion in status line
set nowritebackup							" do not create a backup file

" <leader> key
let mapleader=" "
let maplocalleader=" "

" change working dir to current file dir in window.
autocmd BufEnter * silent! lcd %:p:h
" [script] call change vpwd
autocmd BufEnter * silent! !vpwd "`pwd`"

" auto resize windows when vim is resized
augroup MyAutocmds
	autocmd!
	autocmd VimResized * execute "normal! \<c-w>="
augroup END

" load config files
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' f
endfor

" load mappings
source $HOME/.config/nvim/mappings.vim
