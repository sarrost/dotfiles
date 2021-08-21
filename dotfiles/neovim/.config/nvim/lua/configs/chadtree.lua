-- Focus tree.
vim.api.nvim_set_keymap('n', '<c-h>', ':CHADopen --always-focus<CR>', { noremap = true, silent = true })

---- Open tree.
--vim.api.nvim_set_keymap('n', '<c-h>', ':CHADopen<CR>', { noremap = true, silent = true })

vim.api.nvim_exec([[
"let g:chadtree_settings = { "theme.text_colour_set": "nerdtree_syntax_dark" }
set termguicolors
]], false)

--local chadtree_settings = {
--["theme.text_colour_set"] = 'nerdtree_syntax_dark'
--}
--vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

