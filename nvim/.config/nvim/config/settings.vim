let mapleader=" "
set clipboard+=unnamedplus
set cursorline
set expandtab			    " spaces rule the world now
set foldmethod=indent 		" also auto folds file
set hidden
set inccommand=nosplit      " show effects of command incrementally.
set incsearch
set listchars=eol:¬,space:␣,trail:+,tab:>\ 
set number	                " line numbers
set numberwidth=6
set relativenumber
set scrolloff=10
set shiftwidth=4
set switchbuf=usetab
set tabstop=4			    " display tabs as 4 spaces
set wildmenu	            " completion in status line

""" neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')


""" indentLine
let g:indentLine_bgcolor_term = 16
let g:indentLine_enabled = 1	" hide tabs by default


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
"
" navigate current dir
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>


" kill trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" convert tabs to spaces on save
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :retab<CR>


function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction


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

nmap <silent> \ll :call ToggleList("Location List", 'l')<CR>
nmap <silent> \ee :call ToggleList("Quickfix List", 'c')<CR>


" Auto resize windows when vim is resized.
" Counteracts psuedo-fullscreen.
augroup MyAutocmds
	autocmd!
	autocmd VimResized * execute "normal! \<c-w>="
augroup END



"""         NERDTree
" select last file opened.
function! settings#attempt_select_last_file() abort
	let l:previous=expand('#:t')
	if l:previous != ''
		call search('\v<' . l:previous . '>')
	endif
endfunction

augroup MyNERDTree
    autocmd!
    autocmd User NERDTreeInit call settings#attempt_select_last_file()
augroup END


""""""          Copy pasta (registers, clipboard etc.)
"""         Yoink
let g:yoinkMaxItems = 20
let g:yoinkSyncNumberedRegisters = 1
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkSavePersistently = 1

"""         Subversive
let g:subversiveCurrentTextRegister = 1
let g:subversivePreserveCursorPosition = 1


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
