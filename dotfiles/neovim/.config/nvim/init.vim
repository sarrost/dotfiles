"〖愛〗Neovim main configuration file

" To keep things clean and orderly don't do anything other
" than load plugins in this file.

" Put all mappings in `./mappings.vim`. Put all plugin 
" related settings and mappings in ./config/. Do everything 
" else in `./settings.vim`, it is sourced at the end of 
" this file.

" Load plugins using `vim-plug`. Plugin categories arbitrary,
" just another attempt to keep things orderly.
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

""""         Auto-completion/LSP
Plug 'neoclide/coc.nvim',										" auto completion and plugin environment
	\ {'branch': 'release'}
Plug 'sirver/UltiSnips'											" snippet management
Plug 'lervag/vimtex'												" latex suite

""""         Copy pasta (registers, clipboard etc.)
Plug 'svermeulen/vim-yoink'                 " save and manipulate yank history
Plug 'svermeulen/vim-subversive'            " substitute text with register content
Plug 'junegunn/vim-peekaboo'                " peek registers when CTRL-R and @

""""         Easier reading
Plug 'junegunn/limelight.vim'								" hyperfocus paragraphs
Plug 'junegunn/goyo.vim'										" distraction free vim

""""         Editing
Plug 'christoomey/vim-sort-motion'          " provide sorting op (gs)
Plug 'tpope/vim-commentary'									" provide commenting op (gc)
Plug 'tpope/vim-abolish'										" manipulate variations of a word
Plug 'junegunn/vim-easy-align'              " add complex align motion
Plug 'machakann/vim-sandwich'								" surround motion
Plug 'mbbill/undotree'											" visualize and interact with undo/redo tree

""""         Eye candy
Plug 'ryanoasis/vim-devicons'               " fancy file icons
Plug 'airblade/vim-gitgutter'								" show git diff in gutter, provide diff text obj

""""         File browsing
Plug 'vifm/vifm.vim'												" file browser
Plug 'junegunn/fzf.vim'                     " fuzzy file finder

""""         Misc
Plug 'tpope/vim-fugitive'                   " git wrapper
Plug 'christoomey/vim-conflicted'						" improved git diff mode 
Plug 'tpope/vim-repeat'											" support repeat op for plugins
Plug 'vimwiki/vimwiki'											" create personal wiki
Plug 'kevinoid/vim-jsonc'										" JSONC syntax highlighting

""""         Searching
Plug 'haya14busa/vim-asterisk'              " fancier star Searching
Plug 'markonm/traces.vim'										" highlights patterns and ranges
Plug 'junegunn/vim-slash'										" clear highlighting on move
Plug 'justinmk/vim-sneak'										" two letter search motion
Plug 'lambdalisue/suda.vim'

Plug 'mcchrish/nnn.vim'
"	Plug 'glts/vim-magnum'											" ✓ big int library
" Plug 'glts/vim-radical'											" ✓ convert between number representations
" Plug 'svermeulen/vim-macrobatics'           " ✓ provide improved macro functionality
" Plug 'svermeulen/vim-matchup'								" ✓ operate on matching sets of text
" Plug 'mzlogin/vim-markdown-toc'							" create table of content in md
" Plug 'Konfekt/FastFold'
" Plug 'inkarkat/vim-SpellCheck'
" Plug 'kamykn/spelunker.vim'	
" Plug 'svermeulen/CamelCaseMotion'
" Plug 'mattn/emmet-vim'
" Plug 'wellle/targets.vim'
" Plug 'reedes/vim-pencil'
" Plug 'gabrielelana/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'tpope/vim-unimpaired'
" Plug 'sedm0784/vim-you-autocorrect'

call plug#end()

" source settings
source $XDG_CONFIG_HOME/nvim/settings.vim
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
