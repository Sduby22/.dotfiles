" Author: osennyaya <supersduby@gmail.com>
" Description: Plugins, Options, Import other configs
" File: init.vim

filetype plugin indent on

set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set sts=-1
set smarttab
set smartcase ignorecase
set autoindent
set nu rnu

set completeopt=menuone,noselect

syntax on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-sleuth'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'wakatime/vim-wakatime'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
call plug#end()

let g:go_fmt_autosave = 0

set path+=**                                                                    
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set clipboard+=unnamedplus

let mapleader=" "
nmap Q <Nop> 
imap <C-c> <esc>
set mouse+=a
set noerrorbells visualbell t_vb=

source ~/.config/nvim/firenvim.vim
source ~/.config/nvim/indent.vim
lua require('lua-config')

colorscheme gruvbox
set termguicolors

let g:UltiSnipsExpandTrigger="<C-x>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
