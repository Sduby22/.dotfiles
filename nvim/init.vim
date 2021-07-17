set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set smartcase ignorecase
set autoindent
set nu rnu

syntax on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-sleuth'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
call plug#end()

set path+=**                                                                    
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set clipboard+=unnamedplus

nmap Q <Nop> " You are useless.
set mouse+=a
set noerrorbells visualbell t_vb=

source ~/.config/nvim/firenvim.vim
lua require('lua-config')
