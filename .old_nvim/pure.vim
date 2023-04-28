filetype plugin indent on

set nocompatible
set backspace=indent,eol,start
set timeoutlen=1000
set autoread
set exrc
set secure
set hidden
set laststatus=0
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=0
set sts=-1
set smarttab
set smartcase ignorecase
set autoindent
set nu rnu
set pumheight=10
set completeopt=menuone,noselect
set mouse+=a
set noerrorbells visualbell t_vb=

syntax on

let mapleader=" "

command W w
command Q q
command Wq wq
command WQ wq

map Y y$
nmap Q <Nop>
imap <C-c> <esc>
" imap jk <esc>
vmap s S
sunmap s
map j gj
map k gk

if has('nvim')
    let g:ftplugin_sql_omni_key = '<C-B>'
    " Yank highlighting
    augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
    augroup END
else
    colorscheme default
endif

source ~/.dotfiles/.old_nvim/indent.vim

" :find command
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

imap <S-CR> <esc>o

nmap <leader><tab>1 1gt
nmap <leader><tab>2 2gt
nmap <leader><tab>3 3gt
nmap <leader><tab>4 4gt
nmap <leader><tab>5 5gt
nmap <leader><tab>6 6gt
nmap <leader><tab>7 7gt
nmap <leader><tab>8 8gt
nmap <leader><tab>9 9gt
nmap <leader><tab>n :tabnew<cr>

nmap <leader>w <C-w>

au FocusGained,BufEnter * :checktime
