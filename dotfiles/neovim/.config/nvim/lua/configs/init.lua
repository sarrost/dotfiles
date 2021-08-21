--〖愛〗Neovim plugin config file.

require('configs/taskwiki')
require('configs/treesitter')
require('configs/completion')
require('configs/ultisnips')
require('configs/vimwiki')
-- doesn't work
--require('configs/chadtree')
 -- use { 'ms-jpq/chadtree',
 -- 			branch = 'chad',
 -- 			run = 'python3 -m chadtree deps',
 -- 			cmd = 'CHADdeps' }
-- replace with https://github.com/kyazdani42/nvim-tree.lua
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/ojroques/vim-scrollstatus
-- https://github.com/ojroques/nvim-bufdel
-- https://github.com/ojroques/vim-oscyank
-- https://github.com/ojroques/nvim-lspfuzzy
-- https://github.com/lewis6991/spellsitter.nvim
-- https://github.com/lewis6991/foldsigns.nvim
-- https://oroques.dev/notes/neovim-init/

require('configs/vimtex')
require('configs/subversive')

require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

vim.lsp.set_log_level("debug")
