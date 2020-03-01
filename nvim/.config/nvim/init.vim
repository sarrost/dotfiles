""" Load plugins.
call plug#begin('~/.vim/plugged')

Plug 'svermeulen/vim-yoink'                 " ✓✓ save and manipulate yank history

"""         Autocompletion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lighttiger2505/deoplete-vim-lsp'

"""         Copy pasta (registers, clipboard etc.)
Plug 'svermeulen/vim-subversive'            " ✓✓ substitute text with register content
Plug 'junegunn/vim-peekaboo'                " ✓✓ peek registers when CTRL-R and @

"""         Easier reading
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'umaumax/neoman.vim'

"""         Editing
Plug 'christoomey/vim-sort-motion'          " ✓ gs
Plug 'junegunn/vim-easy-align'              " add complex align motion
Plug 'tpope/vim-surround'                   " ✓✓ manipulate surrounding characters
Plug 'jiangmiao/auto-pairs'                 " ✓✓ auto insert closing brackets
Plug 'svermeulen/vim-macrobatics'           " improved macros

"""         Eye candy
Plug 'unblevable/quick-scope'               " ✓ highlight unique char in words for easy jumping
Plug 'ryanoasis/vim-devicons'               " ✓ fancy file icons
Plug 'Yggdroot/indentLine'

"""         File browsing
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                     " ✓ fuzzy file finder

"""         Misc
Plug 'tpope/vim-fugitive'                   " busy
Plug 'tpope/vim-eunuch'                     " useful file ops cmds
Plug 'tpope/vim-repeat'

"""         Searching
Plug 'brooth/far.vim'
Plug 'haya14busa/is.vim'                    " ✓ incremental search highlighting 
Plug 'haya14busa/vim-asterisk'              " ✓ fancier star Searching
Plug 'wincent/loupe'                        " ✓ better search
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-slash'                   " ✓ clear highlighting on move

"""         Syntax highlighters
Plug 'kovetskiy/sxhkd-vim'                  " ✓ syntax highlighting

"Plug 'mrtazz/simplenote.vim'                " simplenote integration
Plug 'donRaphaco/neotex'
Plug 'junegunn/vim-github-dashboard'
Plug 'neomake/neomake'
"Plug 'gabrielelana/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'nikvdp/neomux'
"Plug 'wellle/targets.vim'
"Plug 'omtom/tcomment_vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
"Plug 'mhinz/vim-signify'
"Plug 'valloric/MatchTagAlways'
"Plug 'mattn/emmet-vim'
"Plug 'reedes/vim-pencil'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

call plug#end()

" default updatetime 4000ms is not good for async update
set updatetime=100

exe 'source $HOME/.config/nvim/settings.vim'

echo "Welcome!"
