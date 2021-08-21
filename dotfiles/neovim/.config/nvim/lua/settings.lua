local utils = require('utils')
--〖愛〗Neovim settings file.

-- Place all non-plugin related, non-mapping settings,
-- configurations and custom functions here. All .vim files
-- in ./config/ are sourced in this file. Mappings are
-- sourced at the end of this file.

local indent = 2

-- always use clipboard instead of + and * regs.
utils.opt('o', 'clipboard', vim.o.clipboard .. 'unnamedplus')
-- give more space for displaying messages.
utils.opt('o', 'cmdheight', 2)
-- enable hilighting for line with cursor.
utils.opt('o', 'cursorline', true)
-- diff mode options.
utils.opt('o', 'diffopt', vim.o.diffopt .. ',vertical,foldcolumn:1')
-- hide vertical separator.
utils.opt('o', 'fillchars', vim.o.fillchars .. 'vert: ')
-- buffer becomes hidden when abandoned.
utils.opt('o', 'hidden', true)
-- ignorecase when searching.
utils.opt('o', 'ignorecase', true)
-- only consider case when uppercase is used.
utils.opt('o', 'smartcase', true)
-- move to nearest result while searching.
utils.opt('o', 'incsearch', true)
-- whitespace characters representations.
utils.opt('o', 'listchars', 'eol:¬,space:␣,trail:+,tab:\\ ┊')
-- show line numbers.
utils.opt('w', 'number', true)
-- use relative line numbers.
utils.opt('w', 'relativenumber', true)
-- default to value of tabstop.
utils.opt('b', 'shiftwidth', 0)
-- disable startup message.
utils.opt('o', 'shortmess', vim.o.shortmess .. 'I')
-- don't pass messages to ins-completion-menu.
utils.opt('o', 'shortmess', vim.o.shortmess .. 'c')
-- always show signcolumn.
utils.opt('o', 'signcolumn', 'yes')
-- jump to first open window that has buffer.
utils.opt('o', 'switchbuf', 'usetab')
-- number of spaces a tab counts for.
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)
-- how often swap file is written to disk.
utils.opt('o', 'updatetime', 50)
-- time to wait for a mapped sequence to complete.
utils.opt('o', 'timeoutlen', 300)
-- select rectangles in visual block mode
utils.opt('o', 'virtualedit', 'block')
-- completion in status line
utils.opt('o', 'wildmenu', true)
-- do not create a backup file
utils.opt('o', 'writebackup', false)
utils.opt('o', 'textwidth', 0)

-- use file for undo history.
utils.opt('o', 'undofile', true)
-- undo history dir.
utils.opt('o', 'undodir', '/tmp/.nvim/undo-dir')
-- use persistent undo history.
if vim.fn.isdirectory(vim.o.undodir) == 0 then
	vim.fn.mkdir(vim.o.undodir, 'p', '0700')
end

-- <leader> key
vim.g.mapleader				= ' '
-- <localleader> key
vim.g.maplocalleader	=	' '

-- " change working dir to current file dir in window.
-- autocmd BufEnter * silent! lcd %:p:h

-- " auto resize windows when vim is resized
-- augroup MyAutocmds
-- 	autocmd!
-- 	autocmd VimResized * execute "normal! \<c-w>="
-- augroup END

-- " load config files
-- for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
-- 	exe 'source' f
-- endfor

-- " load mappings
-- source $HOME/.config/nvim/mappings.vim
