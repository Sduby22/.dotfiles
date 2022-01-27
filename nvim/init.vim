" Author: osennyaya <supersduby@gmail.com>
" Description: Plugins, Options, Import other configs
" File: init.vim

filetype plugin indent on

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
"set nu rnu
set pumheight=10

set completeopt=menuone,noselect

syntax off

let mapleader=" "
nmap Q <Nop> 
imap <C-c> <esc>
" imap jk <esc>
vmap s S
sunmap s
map j gj
map k gk
let g:ftplugin_sql_omni_key = '<C-B>'

set mouse+=a
set noerrorbells visualbell t_vb=

command W w
command Q q
command Wq wq
command WQ wq

" Install vim-plug if not exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

	" Shared plugins
	Plug 'ahmedkhalf/project.nvim'
	Plug 'ethanholz/nvim-lastplace'
	Plug 'max397574/better-escape.nvim'
	Plug 'editorconfig/editorconfig-vim'

	" detect file indetn
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-surround'
	Plug 'windwp/nvim-autopairs'
	"Plug 'Raimondi/delimitMate'
		"let delimitMate_expand_cr = 1
		"let delimitMate_expand_space = 1
		""let delimitMate_expand_inside_quotes = 1
		"let delimitMate_jump_expansion = 1
	Plug 'terrortylor/nvim-comment'
	"Plug 'preservim/nerdcommenter'
	Plug 'junegunn/vim-easy-align'
	Plug 'mg979/vim-visual-multi'

	" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
	" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
	Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

if !exists('g:vscode')
	" Vscode disabled plugins
	if has("macunix")
	  Plug 'ybian/smartim'
	else
	  Plug 'lilydjwg/fcitx.vim'
	endif
	
	Plug 'ianding1/leetcode.vim'
	  let g:leetcode_browser = 'chrome'
	Plug 'sbdchd/neoformat'
	  nmap <leader>f :Neoformat<CR>

	Plug 'akinsho/toggleterm.nvim'
	"Plug 'voldikss/vim-floaterm'
	  "let g:floaterm_keymap_toggle = '<F1>'

	" Plug 'rktjmp/lush.nvim'
	" Plug 'npxbr/gruvbox.nvim'
	Plug 'rktjmp/lush.nvim'
	Plug 'ellisonleao/gruvbox.nvim'
	" Plug 'RRethy/nvim-base16'
	"Plug 'chriskempson/base16-vim'
	"Plug 'Th3Whit3Wolf/one-nvim'
	"
	"if !exists('g:started_by_firenvim')
	Plug 'nvim-lualine/lualine.nvim'
	" Plug 'TimUntersberger/neogit'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'goolord/alpha-nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" Plug 'junegunn/fzf.vim'
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'kyazdani42/nvim-tree.lua'
	  nmap <leader>e :NvimTreeToggle<CR>

	Plug 'francoiscabrol/ranger.vim'
	  let g:ranger_map_keys = 0
	  nmap <leader>o- :Ranger<CR>
	Plug 'rbgrouleff/bclose.vim'
	"endif

	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'wakatime/vim-wakatime'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

	Plug 'lervag/vimtex', { 'for': 'latex' }
	  let g:tex_flavor = 'latex'
	  let g:vimtex_compiler_latexmk = {
	    \ 'options' : [
	    \   '-xelatex',
	    \   '-verbose',
	    \   '-file-line-error',
	    \   '-synctex=1',
	    \   '-interaction=nonstopmode',
	    \ ],
	    \}
	"Plug 'kdheepak/cmp-latex-symbols'
	"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	  "let g:livepreview_previewer = 'open -a Preview'
	  "let g:livepreview_engine = 'xelatex' 
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'ray-x/lsp_signature.nvim'
	
	Plug 'dcampos/nvim-snippy'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'dcampos/cmp-snippy'
	Plug 'hrsh7th/cmp-cmdline'
	" Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	"Plug 'gillescastel/latex-snippets'
endif

call plug#end()

let g:go_fmt_autosave = 0

" :find command
set path+=**                                                                    
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set clipboard=unnamedplus

source ~/.config/nvim/indent.vim

if !exists('g:vscode')

	" if filereadable(expand("~/.vimrc_background"))
	"   set termguicolors
	"   let base16colorspace=256          " Remove this line if not necessary
	"   source ~/.vimrc_background
	" else
	"   set termguicolors
	"   colorscheme gruvbox
	" endif

  set termguicolors
  colorscheme gruvbox

  lua require('lua-config')

  source ~/.config/nvim/firenvim.vim
  source ~/.config/nvim/leaderf.vim

else 

  lua require('vscode-config')
endif

command Vimrc e ~/.config/nvim/init.vim

" Yank highlighting
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>pf :Telescope find_files<cr>
nnoremap <leader>/ :Telescope live_grep<cr>
nnoremap <leader><leader> :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>
nnoremap <leader>ft :Telescope tags<cr>
nnoremap <leader>pp :Telescope projects<cr>
nnoremap <leader>fp :Vimrc<cr>
" nmap <leader>g :Neogit<cr>

nnoremap <c-t> :ToggleTerm<cr>
tmap <c-t> <c-\><c-n>:ToggleTerm<cr>

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

nmap <leader>v :vs<cr>
nmap <leader>b :split<cr>

source ~/.config/nvim/neovide.vim

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

au FocusGained,BufEnter * :checktime
