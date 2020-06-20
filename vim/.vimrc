set nocompatible              " be iMproved, required
set runtimepath+=~/.config/vim,~/.config/vim/after
syntax enable
filetype plugin indent on

nnoremap ; :
set relativenumber
set number

set viminfo+=n~/.vim/viminfo


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
