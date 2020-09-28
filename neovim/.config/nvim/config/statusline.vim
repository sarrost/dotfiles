" filename with dev icon
function s:filename()
	set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ %f\ 
endfunction
" modified flag
function s:modified()
	set statusline+=%m%r%h%w%q
endfunction
" col number
function s:col()
	set statusline+=\ %2c\ 
endfunction
" current line / total lines
function s:lines()
	set statusline+=\ %l\ %L\ 
endfunction
" percentage through file
function s:percentage()
	set statusline+=\ %p\ 
endfunction
" file encoding and filetype
function s:encoding()
	set statusline+=\ %y
	set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
	set statusline+=\[%{&fileformat}\]\  
endfunction
" git branch
function s:git()
	set statusline+=\ %{FugitiveHead()}\ 
endfunction
" conflicted version name
function s:conflicted()
	set statusline+=\ %{ConflictedVersion()}
endfunction
" git added lines
function s:git_added()
	function! GitAdded()
		let [a,m,r] = GitGutterGetHunkSummary()
		return a > 0 ? printf('+%d ', a) : ''
	endfunction
	set statusline+=%{GitAdded()}
endfunction
" git modified lines
function s:git_modified()
	function! GitModified()
		let [a,m,r] = GitGutterGetHunkSummary()
		return m > 0 ? printf(' ~%d ', m) : ''
	endfunction
	set statusline+=%{GitModified()}
endfunction
" git removed lines
function s:git_removed()
	function! GitRemoved()
		let [a,m,r] = GitGutterGetHunkSummary()
		return r > 0 ? printf(' -%d ', r) : ''
	endfunction
	set statusline+=%{GitRemoved()}
endfunction

" reset
set statusline=
call s:encoding()
call s:git_added()
call s:git_modified()
call s:git_removed()
" separation point
set statusline+=%=
call s:modified()
call s:git()
call s:filename()
call s:col()
call s:lines()
call s:percentage()

" conflicted mode
function s:SetupConflicted()
	" reset
	set statusline=
	call s:encoding()
	call s:git_added()
	call s:git_modified()
	call s:git_removed()
	" separation point
	set statusline+=%=
	call s:col()
	call s:lines()
	call s:percentage()
	call s:git()
	call s:modified()
	call s:filename()
	call s:conflicted()
endfunction
augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | call s:SetupConflicted() | endif
augroup END
