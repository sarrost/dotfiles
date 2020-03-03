function! s:goyo_leave()
	Limelight!
	source $HOME/.config/nvim/config/colors.vim
endfunction

function! s:goyo_enter()
	Limelight
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
