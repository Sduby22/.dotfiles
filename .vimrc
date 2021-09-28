" a beginner friendly config file for vim
" use :help for detailed description for each command
" for example:  :help expandtab

set nocompatible

" enable backspace in insert mode
set backspace=indent,eol,start

" enable filetype detection + indent + syntax
filetype plugin indent on
syntax on

" When starting a new line, do smart indent
set smartindent
set autoindent
set smarttab

" the default indentation is 8-space-width tab
" If you want to use 4 space indent, call these:
" set expandtab
" set tabstop=4 
" (or set ts=4 for short)
set noexpandtab
set tabstop=8

" you can ignore these :)
set shiftwidth=0
set softtabstop=-1

" If the searching pattern is all lowercase, then ignore case.
" else dont ignore.
set smartcase ignorecase

" Use :find to recursively find file in current dir.
" ignore .git and node_modules dirs.
set path+=**                                                                    
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**

set wildmenu
set wildmode=longest,full

" Set the default copy register to system clipboard
if has('unnamedplus')
	set clipboard=unnamedplus
else
	set clipboard=unnamed
endif

" enable mouse control
set mouse+=a

" disable visual bells because they are annoying.
set noerrorbells visualbell t_vb=

" Make Ctrl-C behave the same way as esc
imap <C-c> <esc>

command Q q
command W w
command Wq wq
command WQ wq
