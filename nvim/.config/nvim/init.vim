""" Load plugins.
call plug#begin('~/.vim/plugged')

"""         File browsing
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"""         Searching
Plug 'wincent/loupe'                        " better sercch
Plug 'junegunn/vim-slash'                   " ✓ clear highlighting on move
Plug 'brooth/far.vim'
Plug 'haya14busa/is.vim'                    " ✓ incremental search highlighting 
"Plug 'haya14busa/vim-asterisk'

"""         Editing
Plug 'christoomey/vim-sort-motion'          " ✓ gs
Plug 'junegunn/vim-easy-align'              " add complex align motion
Plug 'tpope/vim-surround'                   " more textobj

"""         Copy pasta (registers, clipboard etc.)
Plug 'svermeulen/vim-yoink'                 " ✓ save and manipulate yank history
Plug 'svermeulen/vim-subversive'            " ✓ substitute text with register content
Plug 'junegunn/vim-peekaboo'                " ✓ peek registers when CTRL-R and @

"""         Eye candy
Plug 'ryanoasis/vim-devicons'               " ✓ fancy file icons
Plug 'Yggdroot/indentLine'

"""         Easier reading
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

"""         Autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"""         Syntax highlighters
Plug 'kovetskiy/sxhkd-vim'                  " syntax highlighting

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-eunuch'                     " useful file ops cmds
Plug 'tpope/vim-repeat'
Plug 'mrtazz/simplenote.vim'                " simplenote integration
Plug 'donRaphaco/neotex'
Plug 'junegunn/vim-github-dashboard'
Plug 'neomake/neomake'
"Plug 'nikvdp/neomux'
Plug 'tpope/vim-fugitive'                   " busy
Plug 'tpope/vim-jdaddy'                     " more textobj
Plug 'umaumax/neoman.vim'
Plug 'svermeulen/vim-macrobatics'           " improved macros

call plug#end()

""" Load config files.
let s:config_dir = '$HOME/.config/nvim/config/'
let s:config_files = [ 'colors.vim', 'settings.vim', 'mappings.vim', 'statusline.vim' ]
for filename in s:config_files
    exec 'source ' . s:config_dir . filename
endfor

source ~/.simplenoterc

" center search result.
noremap <plug>(slash-after) zz

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240


let g:indenLine_setColors = 'comment'
