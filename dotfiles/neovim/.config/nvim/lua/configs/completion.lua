-- require'lspconfig'.pyright.setup{}

vim.api.nvim_exec([[
""" completion-nvim
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

]], false)

vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_auto_change_source = 1
