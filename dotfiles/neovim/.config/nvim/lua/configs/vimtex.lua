vim.api.nvim_exec([[

" assume *.tex are latex
let g:tex_flavor = 'latex'
" default pdf viewer
let g:vimtex_view_method='zathura'
" disable automatic view
let g:vimtex_view_automatic = 0

" config toc menu
let g:vimtex_toc_config = { 'show_help' : 0, 'split_width' : 30 }

let g:vimtex_compiler_progname = 'nvr'

" use texdoc to view docs
let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
	call vimtex#doc#make_selection(a:context)
	if !empty(a:context.selected)
		execute '!texdoc' a:context.selected '&'
	endif
	return 1
endfunction

" toggle toc menu
nmap <M-C-T> <plug>(vimtex-toc-toggle) 

]], false)
