""" Load plugins.
call plug#begin('~/.vim/plugged')

"""         Autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"""         Copy pasta (registers, clipboard etc.)
Plug 'svermeulen/vim-yoink'                 " ✓ save and manipulate yank history
Plug 'svermeulen/vim-subversive'            " ✓✓  substitute text with register content
Plug 'junegunn/vim-peekaboo'                " ✓ peek registers when CTRL-R and @

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
Plug 'ryanoasis/vim-devicons'               " ✓ fancy file icons
Plug 'Yggdroot/indentLine'

"""         File browsing
Plug 'scrooloose/nerdtree'
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
Plug 'junegunn/vim-slash'                   " ✓ clear highlighting on move

"""         Syntax highlighters
Plug 'kovetskiy/sxhkd-vim'                  " syntax highlighting

Plug 'mrtazz/simplenote.vim'                " simplenote integration
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

call plug#end()

""" Load config files.
let s:config_dir = '$HOME/.config/nvim/config/'
let s:config_files = [ 'colors.vim', 'settings.vim', 'mappings.vim', 'statusline.vim' ]
for filename in s:config_files
    exec 'source ' . s:config_dir . filename
endfor

source ~/.simplenoterc
