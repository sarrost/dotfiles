""" Load plugins.
call plug#begin('~/.vim/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'mrtazz/simplenote.vim'
Plug 'kovetskiy/sxhkd-vim'                  " syntax highlighting
Plug 'donRaphaco/neotex'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
"Plug 'christoomey/vim-sort-motion'          " gs
Plug 'christoomey/vim-system-copy'
"Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                    " done
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'neomake/neomake'
Plug 'nikvdp/neomux'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'                   " busy
Plug 'tpope/vim-jdaddy'                     " more textobj
Plug 'tpope/vim-surround'                   " more textobj
"Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'wincent/ferret'                       " <l>a, <l>s, <l>S
Plug 'wincent/loupe'
Plug 'umaumax/neoman.vim'

call plug#end()

""" Load config files.
let s:config_dir = '$HOME/.config/nvim/config/'
let s:config_files = [ 'color.vim', 'settings.vim', 'mappings_normal.vim', 'behaviour.vim' ]
for filename in s:config_files
    exec 'source ' . s:config_dir . filename
endfor

source ~/.simplenoterc
