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



""" NERDTree
" select last file opened.
function! behaviour#attempt_select_last_file() abort
	let l:previous=expand('#:t')
	if l:previous != ''
		call search('\v<' . l:previous . '>')
	endif
endfunction

augroup MyNERDTree
    autocmd!
    autocmd User NERDTreeInit call behaviour#attempt_select_last_file()
augroup END


