""" Load plugins.
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'wincent/loupe'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

""" Load config files.
let s:config_dir = '$HOME/.config/nvim/config/'
let s:config_files = [ 'color.vim', 'settings.vim', 'mappings_normal.vim' ]
for filename in s:config_files
    exec 'source ' . s:config_dir . filename
endfor




" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
