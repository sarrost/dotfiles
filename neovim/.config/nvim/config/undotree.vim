" set tree node shape
let g:undotree_TreeNodeShape = ''
" focus panel when toggled
let g:undotree_SetFocusWhenToggle = 1
" tree is left and diff window is bottom
let g:undotree_WindowLayout = 2
" 'x s' instead of 'x seconds ago'
let g:undotree_shortIndicators = 1
" hide help line
let g:undotree_HelpLine = 0

" toggle panel
nnoremap <silent> <M-C-U> :UndotreeToggle<CR>
