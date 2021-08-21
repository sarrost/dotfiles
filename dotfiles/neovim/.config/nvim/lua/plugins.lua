--〖愛〗Neovim plugins file.

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup( function()
	-- packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

	----------------------------------------------------------
	-- IDE
	----------------------------------------------------------
	-- A collection of common configurations for Neovim's 
	-- built-in LSC.
	use { 'neovim/nvim-lspconfig' }

	-- Adds the missing :LspInstall <language> command to 
	-- conveniently install language servers.
	use { 'kabouzeid/nvim-lspinstall' }

	-- Snippets framework.
	use { 'sirver/UltiSnips' }

	-- Auto completion framework for neovim's built-in LSP.
	use { 'nvim-lua/completion-nvim' }

	----------------------------------------------------------
	-- SPECIAL ENV
	----------------------------------------------------------
	-- ledger-cli: Filetype detection, syntax highlighting, 
	-- auto-formatting, auto-completion, and other tools.
	use { 'ledger/vim-ledger' }

	-- LaTeX: Full IDE package.
	use { 'lervag/vimtex' }

	----------------------------------------------------------
	-- VISUAL
	----------------------------------------------------------
	-- Colorscheme: Visual Studio Code TokyoNight theme port.
	use { 'folke/tokyonight.nvim' }
	use { 'navarasu/onedark.nvim' }

	-- Better syntax highlighting: Provide a simple and easy 
	-- way to use the interface for tree-sitter.
  use { 'nvim-treesitter/nvim-treesitter',
  			cmd = 'TSUpdate',
  			cond = "vim.fn.has('nvim-0.5') == 1" }

	----------------------------------------------------------
	-- EDITING
	----------------------------------------------------------
	-- Subversion motion: replace delted text with text in
	-- register.
	use { 'svermeulen/vim-subversive' }

	-- Sort motion.
	use { 'christoomey/vim-sort-motion' }

	----------------------------------------------------------
	-- MISCELLANEOUS
	----------------------------------------------------------
	-- Personal wiki.
	use { 'vimwiki/vimwiki'	}

	-- Taskwarrior and Vimwiki integration
	use { 'tools-life/taskwiki' ,
				run = 'pip3 install --user --upgrade -r requirements.txt' }

	-- Git wrapper.
	use { 'tpope/vim-fugitive' }

--https://github.com/b3nj5m1n/kommentary

  -- Simple plugins can be specified as strings.
  use '9mm/vim-closer'
--https://github.com/hoob3rt/lualine.nvim
--Plug 'kyazdani42/nvim-web-devicons'
--https://github.com/wfxr/minimap.vim
--https://github.com/lukas-reineke/indent-blankline.nvim

-- """"         Copy pasta (registers, clipboard etc.)
-- Plug 'svermeulen/vim-yoink'                 " save and manipulate yank history
-- Plug 'junegunn/vim-peekaboo'                " peek registers when CTRL-R and @
--
-- """"         Easier reading
-- Plug 'junegunn/limelight.vim'								" hyperfocus paragraphs
-- Plug 'junegunn/goyo.vim'										" distraction free vim
--
-- """"         Editing
-- Plug 'tpope/vim-commentary'									" provide commenting op (gc)
-- Plug 'tpope/vim-abolish'										" manipulate variations of a word
-- Plug 'junegunn/vim-easy-align'              " add complex align motion
-- Plug 'machakann/vim-sandwich'								" surround motion
-- Plug 'mbbill/undotree'											" visualize and interact with undo/redo tree
--
-- """"         Eye candy
-- Plug 'ryanoasis/vim-devicons'               " fancy file icons
		-- Plug 'airblade/vim-gitgutter'								" show git diff in gutter, provide diff text obj
		-- REPLACE: https://github.com/lewis6991/gitsigns.nvim
--
-- """"         File browsing
-- Plug 'vifm/vifm.vim'												" file browser
-- Plug 'junegunn/fzf.vim'                     " fuzzy file finder
--
-- """"         Misc
-- Plug 'tpope/vim-fugitive'                   " git wrapper
-- Plug 'christoomey/vim-conflicted'						" improved git diff mode
-- Plug 'tpope/vim-repeat'											" support repeat op for plugins
-- Plug 'vimwiki/vimwiki'											" create personal wiki
-- Plug 'kevinoid/vim-jsonc'										" JSONC syntax highlighting
--
-- """"         Searching
-- Plug 'haya14busa/vim-asterisk'              " fancier star Searching
-- Plug 'markonm/traces.vim'										" highlights patterns and ranges
-- Plug 'junegunn/vim-slash'										" clear highlighting on move
-- Plug 'justinmk/vim-sneak'										" two letter search motion
-- " Plug 'lambdalisue/suda.vim'
--
-- Plug 'ptzz/lf.vim'
-- Plug 'rbgrouleff/bclose.vim'
-- Plug 'ledger/vim-ledger'
-- Plug 'jiangmiao/auto-pairs'
-- "	Plug 'glts/vim-magnum'											" ✓ big int library
-- " Plug 'glts/vim-radical'											" ✓ convert between number representations
-- " Plug 'svermeulen/vim-macrobatics'           " ✓ provide improved macro functionality
-- " Plug 'svermeulen/vim-matchup'								" ✓ operate on matching sets of text
-- " Plug 'mzlogin/vim-markdown-toc'							" create table of content in md
-- " Plug 'Konfekt/FastFold'
-- " Plug 'inkarkat/vim-SpellCheck'
-- " Plug 'kamykn/spelunker.vim'
-- " Plug 'svermeulen/CamelCaseMotion'
-- " Plug 'mattn/emmet-vim'
-- " Plug 'wellle/targets.vim'
-- " Plug 'reedes/vim-pencil'
-- " Plug 'gabrielelana/vim-markdown'
-- " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
-- " Plug 'tpope/vim-unimpaired'
-- " Plug 'sedm0784/vim-you-autocorrect'
--
-- " Plug 'skamsie/vim-lineletters'




end)

--lua << EOF
--EOF

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
--
--""" nvim-lsp
--lua << EOF
--require'lspconfig'.pyright.setup{}
--EOF
--
--""" completion-nvim
--" Use completion-nvim in every buffer
--autocmd BufEnter * lua require'completion'.on_attach()
--
--let g:completion_enable_snippet = 'UltiSnips'
--
--" Set completeopt to have a better completion experience
--set completeopt=menuone,noinsert,noselect
--
--let g:completion_auto_change_source = 1
