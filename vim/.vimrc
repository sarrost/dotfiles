set nocompatible              " be iMproved, required
syntax enable
filetype plugin indent on

nnoremap ; :
set relativenumber
set number


" clear registers
function! ClearRegs()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
    echo 'Registers cleared.'
endfunction
nnoremap <silent> <space>C :call ClearRegs()<CR>

set incsearch
