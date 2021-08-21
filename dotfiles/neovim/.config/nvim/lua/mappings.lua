--〖愛〗Neovim mappings file.

-- Put all non-plugin related mappings here.

-- My suckless terminal build remaps specific keys onto new keys. 
-- Map these keys back to their original keys.
vim.api.nvim_set_keymap('n', '<f13>', '<c-i>', { noremap = true })
vim.api.nvim_set_keymap('n', '<f14>', '<c-[>', { noremap = true })

-- Fullscreen buffer.
vim.api.nvim_set_keymap('n', '<m-`>', ':only<CR>', { noremap = true, silent = true })

-- Disable backspace, rely on C-H.
vim.api.nvim_set_keymap('i', '<bs>', '<nop>', {})

-- Move one char left.
vim.api.nvim_set_keymap('c', '<m-h>', '<left>', { noremap = true })

-- Move one word left.
vim.api.nvim_set_keymap('c', '<m-c-h>', '<s-left>', { noremap = true })

-- Move one char right.
vim.api.nvim_set_keymap('c', '<m-l>', '<right>', { noremap = true })

-- Move one word right.
vim.api.nvim_set_keymap('c', '<m-c-l>', '<s-right>', { noremap = true })

-- Toggle color column.
vim.api.nvim_set_keymap('n', '<m-s-bar>', 
	':execute "set colorcolumn=" . (&colorcolumn == "" ? "60,80,100,120" : "")<CR>', 
	{ noremap = true, silent = true })

-- Toggle hidden characters.
vim.api.nvim_set_keymap('n', '<m-c-h>',
	':execute "set list!"<cr> :execute "set colorcolumn=" . (&colorcolumn == "" ? "60" : "")<cr>', 
	{ noremap = true, silent = true })

-- Clear search highlighting.
vim.api.nvim_set_keymap('n', '<leader>n', 
	':noh<cr>:echo "Search highlighting off."<cr>', 
	{ noremap = true, silent = true })

-- Reload nvim.
-- TODO: make ultisnip only execute if ultisnip installed.
vim.api.nvim_set_keymap('n', '<leader>re', 
	':luafile ~/.config/nvim/init.lua<CR>:call UltiSnips#RefreshSnippets()<CR>:echo \'instance reloaded\'<CR>', 
	{ noremap = true })

-- Kill trailing whitespace.
vim.api.nvim_exec([[
function! StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunction
]], false)
vim.api.nvim_set_keymap('n', '<leader>ws', 
	':call StripTrailingWhitespaces()<CR>:echo "\'" . expand(\'%:f\') . "\' stripped of all trailing whitespace."<CR>', 
	{ noremap = true })

-- Yank to end of line.
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Toggle spell-checking.
-- TODO: conditionally show mode.
vim.api.nvim_set_keymap('n', '<leader>sp', 
	':set spell!<CR>:echo "Toggle spelling."<CR>', 
	{ noremap = true })

-- Quickly fix spelling errors.
--" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
