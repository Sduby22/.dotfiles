" Author: osennyaya <supersduby@gmail.com>
" Description: Functions to quickly switch between space/tab indent
" File: indent.vim

function UseSpace(space)
    setlocal expandtab
    exe 'setlocal shiftwidth='.a:space
    " exe 'setlocal tabstop='.a:space
endfunction

function UseTab(tab)
    setlocal noexpandtab
    exe 'setlocal shiftwidth='.a:tab
    exe 'setlocal tabstop='.a:tab
endfunction
