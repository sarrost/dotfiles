" The command to run
let g:nnn#command = 'n'
" Disable default mappings
let g:nnn#set_default_mappings = 0
" Replace netrw
let g:nnn#replace_netrw = 1
" nnn keybinds
let g:nnn#action = {
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit' 
	\ }

" Start nnn
nnoremap <c-f> :NnnPicker<cr>
