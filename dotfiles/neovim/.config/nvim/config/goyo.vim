" custom behaviour when entering goyo mode
function! s:goyo_enter()
	Limelight
endfunction

" custom behaviour when leaving goyo mode
function! s:goyo_leave()
	Limelight!
	source $HOME/.config/nvim/config/colors.vim
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

" toggle goyo
nnoremap <silent> <M-C-G> :Goyo<CR>
