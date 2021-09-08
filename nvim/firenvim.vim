" Author: osennyaya <supersduby@gmail.com>
" Description: config for firenvim
" File: firenvim.vim

if exists('g:started_by_firenvim')
    colorscheme one-nvim
    set background=dark

    let s:fontsize = 22
    function! AdjustFontSizeF(amount)
      let s:fontsize = s:fontsize+a:amount
      execute "set guifont=Fira\\ Code:h" . s:fontsize
    endfunction

    noremap  <C-=> :call AdjustFontSizeF(1)<CR>
    noremap  <C--> :call AdjustFontSizeF(-1)<CR>
    inoremap <C-=> :call AdjustFontSizeF(1)<CR>
    inoremap <C--> :call AdjustFontSizeF(-1)<CR>
    nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
endif
