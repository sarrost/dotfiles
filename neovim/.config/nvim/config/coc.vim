" Use <c-space> to trigger completion (cancel?)
inoremap <silent><expr> <s-space> coc#refresh()

" confirm completion
inoremap <expr> <c-space> pumvisible() ? "\<C-y>" : "\<CR>"
