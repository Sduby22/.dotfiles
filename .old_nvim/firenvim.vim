" Author: osennyaya <supersduby@gmail.com>
" Description: config for firenvim
" File: firenvim.vim

if exists('g:started_by_firenvim')

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

    let g:dont_write = v:false
    function! My_Write(timer) abort
	let g:dont_write = v:false
	write
    endfunction

    function! Delay_My_Write() abort
	if g:dont_write
	    return
	end
	let g:dont_write = v:true
	call timer_start(10000, 'My_Write')
    endfunction

    au TextChanged * ++nested call Delay_My_Write()
    au TextChangedI * ++nested call Delay_My_Write()
endif
