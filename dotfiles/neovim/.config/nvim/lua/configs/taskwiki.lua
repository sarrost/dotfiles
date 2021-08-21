vim.g.taskwiki_disable_concealcursor = true

vim.api.nvim_exec([[
" Better insert mappings for list items
function TaskListItemInsert()
	normal ^
	if getline('.') =~ '\v(\s+)?(-|\*)\s\[(\s|X|x|\.|o)\].*'
		normal f]2l
	endif
	startinsert
endfunction

function TaskListItemAppend()
	if getline('.') =~ '\v(\s+)?(-|\*)\s\[(\s|X|x|\.|o)\].*'
		normal $F#2h
		startinsert
	else
		startinsert!
	endif
endfunction

function SetTaskWikiOptions()
	nnoremap <buffer><silent> I :call TaskListItemInsert()<CR>
	nnoremap <buffer><silent> A :call TaskListItemAppend()<CR>
endfunction

autocmd Filetype vimwiki call SetTaskWikiOptions()

set concealcursor=n

nnoremap <silent> <c-j> :VimwikiToggleListItem<CR>j
nnoremap <silent> <c-k> :VimwikiToggleListItem<CR>k
nnoremap <silent> <c-l> :VimwikiToggleListItem<CR>
nnoremap <silent> <c-h> :TaskWikiToggle<CR>
]], false)
