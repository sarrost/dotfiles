"""
" Place all non-mapping settings, configurations and custom functions here.
"""
let mapleader=" "
set cursorline
set hidden
"set inccommand=nosplit      " show effects of command incrementally.
set incsearch
set listchars=eol:¬,space:␣,trail:+,tab:\ ┊
set number	                " line numbers
set numberwidth=6
set relativenumber
set scrolloff=10
set wildmenu	            " completion in status line
set virtualedit=block
set splitbelow
set switchbuf=usetab
" how often swap file is written to disk. Plugins may use
" this for updating UI.
set updatetime=20
" Always use clipboard instead of + and * regs. This might
" give an error sometimes if you use `xclip` instead of say
" `xsel`.
set clipboard+=unnamedplus
" tabs are \t, they occupy to columns, spaces are promoted
" to tab upon expansion
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" map C-i back to C-i
"nnoremap <F7> <C-i>

""" Load config files.
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' f
endfor





""""""          ~Custom
" change working dir to current file dir in window.
autocmd BufEnter * silent! lcd %:p:h


" toggle qf/loc list
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> \i :call ToggleList("Location List", 'l')<CR>
nmap <silent> \ee :call ToggleList("Quickfix List", 'c')<CR>


" Auto resize windows when vim is resized.
" Counteracts psuedo-fullscreen.
augroup MyAutocmds
	autocmd!
	autocmd VimResized * execute "normal! \<c-w>="
augroup END

" auto resize windows when vim is resized
" counteracts psuedo-fullscreen
augroup MyAutocmds
	autocmd!
	autocmd VimResized * execute "normal! \<c-w>="
augroup END


highlight QuickScopePrimary cterm=underline,bold
highlight QuickScopeSecondary cterm=underline,bold,italic


exe 'source $HOME/.config/nvim/mappings.vim'


let g:asyncrun_open = 8
nnoremap <silent> \pb :AsyncTask project-build<CR>
