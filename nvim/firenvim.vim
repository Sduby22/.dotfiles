let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

if exists('g:started_by_firenvim')
    let s:fontsize = 12
    function! AdjustFontSizeF(amount)
      let s:fontsize = s:fontsize+a:amount
      execute "set guifont=DejaVuSansMono:h" . s:fontsize
      call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
    endfunction

    noremap  <C-=> :call AdjustFontSizeF(1)<CR>
    noremap  <C--> :call AdjustFontSizeF(-1)<CR>
    inoremap <C-=> :call AdjustFontSizeF(1)<CR>
    inoremap <C--> :call AdjustFontSizeF(-1)<CR>
endif

