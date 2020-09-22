" remove statusline and line number from fzf window
autocmd! FileType fzf set laststatus=0 noshowmode noruler norelativenumber nonumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler norelativenumber nonumber

" fzf git repo, default to current dir otherwise
function! FilesGit()
		let l:isGit = strlen(system("git rev-parse --is-inside-work-tree 2>/dev/null"))
		execute l:isGit > 0 ? 'GFiles': 'Files %:p:h'
endfunction

nnoremap <silent> <M-space> :call FilesGit()<CR>
nnoremap <silent> <M-C-space> :Buffers<CR>
nnoremap <silent> <M-C-G> :GFiles?<CR>
nnoremap <silent> <M-r> :Rg<CR>
nnoremap <silent> <M-l> :Lines<CR>
nnoremap <silent> <M-C-L> :BLines<CR>
nnoremap <silent> <M-.> :History<CR>
nnoremap <silent> <M-;> :History:<CR>
nnoremap <silent> <M-/> :History/<CR>
nnoremap <silent> <M-h> :Help<CR>
nnoremap <silent> <M-m> :Maps<CR>
nnoremap <silent> <M-f> :Filetypes<CR>
nnoremap <silent> <M-S-:> :Commands<CR>
" emulate cf script
nnoremap <silent> <C-S> :Files $XDG_CONFIG_HOME/cf<CR>
