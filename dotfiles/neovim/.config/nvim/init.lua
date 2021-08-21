require('plugins')
require('settings')
require('mappings')
require('configs')

---- nvim sources init.lua before terminal/gui detection.
---- vim.api.nvim_exec([[ autocmd VimEnter * silent! colorscheme mine ]], false)
--require('material').set()
--vim.g.material_style = "darker"
--vim.g.material_disable_background = true

vim.o.termguicolors = true
--vim.g.tokyonight_style = "night"
--vim.g.tokyonight_transparent = true
--vim.cmd[[colorscheme tokyonight]]
--
---- TODO: Improve this.
--vim.api.nvim_exec([[ autocmd VimEnter * silent! hi CursorLine ctermbg=none guibg=none cterm=none gui=none ]], false)





vim.g.onedark_style = 'deep'
vim.g.onedark_transparent_background = true
vim.cmd[[colorscheme onedark]]
vim.api.nvim_exec([[ autocmd VimEnter * silent! hi CursorLine ctermbg=none guibg=none cterm=none gui=none ]], false)




--" source settings
--source $XDG_CONFIG_HOME/nvim/settings.vim
--map *  <Plug>(asterisk-z*)
--map #  <Plug>(asterisk-z#)
--map g* <Plug>(asterisk-gz*)
--map g# <Plug>(asterisk-gz#)
--
--
--let g:python3_host_prog = '/usr/bin/python' " -------- Set python 3 provider
--let g:python_host_prog = '/usr/bin/python2' " ---------- Set python 2 provider
--
--let g:AutoPairsFlyMode = 1
--let g:AutoPairsShortcutBackInsert = '<M-b>'
--let g:AutoPairsShortcutJump = '<C-l>'
