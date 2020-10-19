"〖愛〗Neovim mappings file

" Put all non-plugin related mappings here.

" My suckless terminal build remaps specific keys onto new
" keys. Map these keys back to their original keys.
nnoremap <F13> <C-I>
" nnoremap <F14> <C-[>

" fullscreen buffer
nnoremap <silent> <M-`> :only<CR>
" toggle color column
nnoremap <silent> <M-S-Bar> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60,80,100,120" : "")<CR>
" disable backspace, rely on C-H
imap <bs> <nop>
" move one char left
cnoremap <M-h> <left>
" move one word left
cnoremap <M-C-H> <S-left>
" toggle hidden characters
nnoremap <silent> <M-C-H> :execute "set list!"<CR> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<CR>
" move one char right
cnoremap <M-l> <right>
" move one word right
cnoremap <M-C-L> <S-right>
" navigate tabs
nnoremap <silent> <M-C-J> :tabnext<CR>
nnoremap <silent> <M-C-K> :tabprev<CR>
" clear search highligting
nnoremap <silent> <space>n :noh<CR>
" reload nvim
nnoremap <space>re :source ~/.config/nvim/init.vim<CR>:call UltiSnips#RefreshSnippets()<CR>:echo 'instance reloaded'<CR>
" kill trailing whitespace
function! StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunction
nnoremap <space>ws :call StripTrailingWhitespaces()<CR>:echo "'" . expand('%:f') . "' stripped of all trailing whitespace"<CR>
" write file as root
nnoremap <space>ww :w !doas tee %<CR>:echo "'" . expand('%:f') . "', written as root"<CR>
" yank to end of line
nnoremap Y y$

" " toggle spell-checking
" nnoremap <silent> <M-C-S> :set spell!<CR>:echo "Toggle spelling"<CR>

" " quickly fix spelling errors
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
