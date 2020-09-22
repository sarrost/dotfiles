"〖愛〗Neovim settings configuration file.

" Place all non-plugin related, non-mapping settings, 
" configurations and custom functions here. All .vim
" files in ./config/ are sourced in this file. Mappings
" are sourced at the end of this file.

" disable startup message
set shortmess+=I 
let mapleader=" "
set smartcase
"set cursorline
"set hidden
""set inccommand=nosplit      " show effects of command incrementally.
set incsearch
set listchars=eol:¬,space:␣,trail:+,tab:\ ┊
" line numbers
set number	                
set relativenumber
"set scrolloff=10
set wildmenu			            " completion in status line
set virtualedit=block
set switchbuf=usetab
set updatetime=100						" how often swap file is written to disk.
" number of spaces a tab counts for
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Always use clipboard instead of + and * regs
set clipboard+=unnamedplus
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

" Load config files.
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' f
endfor

" change working dir to current file dir in window.
autocmd BufEnter * silent! lcd %:p:h
" [script] call change vpwd
autocmd BufEnter * silent! !vpwd "`pwd`"

"" toggle qf/loc list
"function! ToggleList(bufname, pfx)
"  let buflist = GetBufferList()
"  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"    if bufwinnr(bufnum) != -1
"      exec(a:pfx.'close')
"      return
"    endif
"  endfor
"  if a:pfx == 'l' && len(getloclist(0)) == 0
"      echohl ErrorMsg
"      echo "Location List is Empty."
"      return
"  endif
"  let winnr = winnr()
"  exec(a:pfx.'open')
"  if winnr() != winnr
"    wincmd p
"  endif
"endfunction
"
"nmap <silent> \i :call ToggleList("Location List", 'l')<CR>
"nmap <silent> \ee :call ToggleList("Quickfix List", 'c')<CR>
"
"
"" Auto resize windows when vim is resized.
"" Counteracts psuedo-fullscreen.
"augroup MyAutocmds
"	autocmd!
"	autocmd VimResized * execute "normal! \<c-w>="
"augroup END
"
"" auto resize windows when vim is resized
"" counteracts psuedo-fullscreen
"augroup MyAutocmds
"	autocmd!
"	autocmd VimResized * execute "normal! \<c-w>="
"augroup END
"
"let g:asyncrun_open = 8
"nnoremap <silent> \pb :AsyncTask project-build<CR>

" Use persistent history.
if !isdirectory("/tmp/vim-undo-dir")
    call mkdir("/tmp/vim-undo-dir", "", 0700)
endif
set undodir=/tmp/vim-undo-dir
set undofile

exe 'source $HOME/.config/nvim/mappings.vim'

