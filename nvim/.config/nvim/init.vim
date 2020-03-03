"〖愛〗Neovim configuration file.
"
"		~/.config/nvim/init.vim
"
" To keep things clean and orderly don't do anything other
" than load plugins in this file.
"
" Put all mappings, including plugin related mappings, in
" `./mappings.vim`. Do everything else in `./settings.vim`,
" it is sourced at the end of this file.


" Load plugins using `vim-plug`. Plugin categories arbitrary,
" just another attempt to keep things orderly.
call plug#begin('~/.vim/plugged')

"""         Autocompletion
Plug 'prabirshrestha/async.vim'							" ✓ provide async interface for vim-lsp
Plug 'prabirshrestha/vim-lsp'								" ✓ provide lsp support
Plug 'Shougo/deoplete.nvim',
	\ { 'do': ':UpdateRemotePlugins' }				" ✓ provide completion menu support
Plug 'lighttiger2505/deoplete-vim-lsp'			" ✓ support for vim-lsp and deoplete
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

"""         Copy pasta (registers, clipboard etc.)
Plug 'svermeulen/vim-yoink'                 " ✓✓ save and manipulate yank history
Plug 'svermeulen/vim-subversive'            " ✓✓ substitute text with register content
Plug 'junegunn/vim-peekaboo'                " ✓✓ peek registers when CTRL-R and @

"""         Easier reading
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'umaumax/neoman.vim'

"""         Editing
Plug 'christoomey/vim-sort-motion'          " ✓ provide sorting op (gs)
Plug 'glts/vim-radical'											" ✓ convert between number representations
Plug 'jiangmiao/auto-pairs'                 " ✓✓ auto insert closing brackets
Plug 'junegunn/vim-easy-align'              " add complex align motion
Plug 'svermeulen/vim-macrobatics'           " ✓ provide improved macro functionality
Plug 'tpope/vim-commentary'									" ✓ provide commenting op (gc)
Plug 'tpope/vim-surround'                   " ✓✓ manipulate surrounding characters

"""         Eye candy
Plug 'unblevable/quick-scope'               " ✓ highlight unique char in words for easy jumping
Plug 'ryanoasis/vim-devicons'               " ✓ fancy file icons
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

"""         File browsing
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                     " ✓ fuzzy file finder

"""         Misc
Plug 'tpope/vim-fugitive'                   " git wrapper
Plug 'tpope/vim-eunuch'                     " useful file ops cmds
Plug 'tpope/vim-repeat'											" ✓ support repeat op for plugins
Plug 'glts/vim-magnum'											" ✓ big int library

"""         Searching
Plug 'brooth/far.vim'
Plug 'haya14busa/is.vim'                    " ✓ incremental search highlighting
Plug 'haya14busa/vim-asterisk'              " ✓ fancier star Searching
Plug 'wincent/loupe'                        " ✓ better search
Plug 'markonm/traces.vim'										" ✓ highlights patterns and ranges
Plug 'junegunn/vim-slash'                   " ✓ clear highlighting on move

"""         Syntax highlighters
Plug 'kovetskiy/sxhkd-vim'                  " ✓ syntax highlighting

Plug 'mzlogin/vim-markdown-toc'

" Plug 'inkarkat/vim-SpellCheck'
"Plug 'kamykn/spelunker.vim'
"Plug 'svermeulen/vim-matchup'
"Plug 'svermeulen/CamelCaseMotion'
"Plug 'mattn/emmet-vim'

"Plug 'wellle/targets.vim'
"Plug 'reedes/vim-pencil'

"Plug 'donRaphaco/neotex'
"Plug 'junegunn/vim-github-dashboard'
"Plug 'neomake/neomake'
"Plug 'gabrielelana/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'nikvdp/neomux'
"Plug 'tpope/vim-unimpaired'
"Plug 'valloric/MatchTagAlways'

call plug#end()

" source settings
exe 'source $HOME/.config/nvim/settings.vim'


