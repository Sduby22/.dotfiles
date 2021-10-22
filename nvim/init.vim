" Author: osennyaya <supersduby@gmail.com>
" Description: Plugins, Options, Import other configs
" File: init.vim

filetype plugin indent on

set laststatus=0
set smartindent
set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=0
set sts=-1
set smarttab
set smartcase ignorecase
set autoindent
"set nu rnu
set pumheight=10

set completeopt=menuone,noselect

syntax off

" Install vim-plug if not exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Shared plugins
Plug 'airblade/vim-rooter'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-scripts/gitignore'

" detect file indetn
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
        let delimitMate_expand_cr = 1
        let delimitMate_expand_space = 1
        "let delimitMate_expand_inside_quotes = 1
        let delimitMate_jump_expansion = 1
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'

Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat','do': ':TSUpdate'}  
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

if !exists('g:vscode')
" Vscode disabled plugins
if has("macunix")
  Plug 'ybian/smartim'
endif
Plug 'liuchengxu/graphviz.vim', { 'for': 'dot' }
Plug 'voldikss/vim-floaterm'
  let g:floaterm_keymap_toggle = '<F1>'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'RRethy/nvim-base16'
"Plug 'chriskempson/base16-vim'
"Plug 'Th3Whit3Wolf/one-nvim'

"Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'gillescastel/latex-snippets'
Plug 'lervag/vimtex', { 'for': 'latex' }
  let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'kdheepak/cmp-latex-symbols'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  let g:livepreview_previewer = 'open -a Preview'
  let g:livepreview_engine = 'xelatex' 
endif

call plug#end()

let g:go_fmt_autosave = 0

set path+=**                                                                    
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set clipboard=unnamedplus

let mapleader=" "
nmap Q <Nop> 
imap <C-c> <esc>
map j gj
map k gk
let g:ftplugin_sql_omni_key = '<C-B>'

set mouse+=a
set noerrorbells visualbell t_vb=

command W w
command Q q
command Wq wq
command WQ wq

let g:tex_flavor = 'latex'

source ~/.config/nvim/indent.vim

if !exists('g:vscode')

	if filereadable(expand("~/.vimrc_background"))
	  "let base16colorspace=256          " Remove this line if not necessary
	  source ~/.vimrc_background
	else
	  colorscheme gruvbox
	  set termguicolors
	endif

  let g:UltiSnipsExpandTrigger="<C-x>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  lua require('lua-config')

  source ~/.config/nvim/firenvim.vim
  source ~/.config/nvim/leaderf.vim

else 

  lua requite('vscode-config')
endif

command Vimrc e ~/.config/nvim/init.vim

" Yank highlighting
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END
