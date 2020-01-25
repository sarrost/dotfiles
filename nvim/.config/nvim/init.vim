""" Load plugins.
call plug#begin('~/.vim/plugged')
"Plug 'haya14busa/is.vim'
"Plug 'haya14busa/vim-asterisk'
"Plug 'osyo-manga/vim-anzu'
Plug 'junegunn/limelight.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-subversive'
Plug 'brooth/far.vim'

Plug 'junegunn/vim-peekaboo'                " peek registers when CTRL-R and @
Plug 'junegunn/vim-slash'                   " center screen on search
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-eunuch'                     " useful file ops cmds
Plug 'tpope/vim-repeat'
Plug 'mrtazz/simplenote.vim'                " simplenote integration
Plug 'kovetskiy/sxhkd-vim'                  " syntax highlighting
Plug 'donRaphaco/neotex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'christoomey/vim-sort-motion'          " gs
Plug 'christoomey/vim-system-copy'
Plug 'honza/vim-snippets'
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

noremap <plug>(slash-after) zz

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240


" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)


"nmap <leader>s <plug>(SubversiveSubstituteRange)
"xmap <leader>s <plug>(SubversiveSubstituteRange)
"nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
