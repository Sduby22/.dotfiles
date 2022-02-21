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
	if g:sdubygui == 1
	    if has("macunix")
	      Plug 'ybian/smartim'
	    else
	      Plug 'lilydjwg/fcitx.vim'
	    endif

	    Plug 'ianding1/leetcode.vim'
	      let g:leetcode_browser = 'chrome'
	    Plug 'rktjmp/lush.nvim'
	    Plug 'ellisonleao/gruvbox.nvim'
	    Plug 'nvim-lualine/lualine.nvim'
	    Plug 'kyazdani42/nvim-web-devicons' " for file icons
	    Plug 'wakatime/vim-wakatime'
	    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
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
	endif

	Plug 'jeffkreeftmeijer/vim-dim'
	Plug 'sbdchd/neoformat'
	  nmap <leader>f :Neoformat<CR>

	Plug 'akinsho/toggleterm.nvim'
	    nnoremap <c-t> :ToggleTerm<cr>
	    tmap <c-t> <c-\><c-n>:ToggleTerm<cr>
	Plug 'nvim-lua/plenary.nvim'
	Plug 'goolord/alpha-nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" Plug 'junegunn/fzf.vim'
	Plug 'kyazdani42/nvim-tree.lua'
	  nmap <leader>e :NvimTreeToggle<CR>

	Plug 'francoiscabrol/ranger.vim'
	  let g:ranger_map_keys = 0
	  nmap <leader>o- :Ranger<CR>
	Plug 'rbgrouleff/bclose.vim'
	"endif

	Plug 'lukas-reineke/indent-blankline.nvim'

	" Plug 'lervag/vimtex', { 'for': 'latex' }
	  let g:tex_flavor = 'tex'
	"   let g:vimtex_compiler_latexmk = {
	"     \ 'options' : [
	"     \   '-xelatex',
	"     \   '-verbose',
	"     \   '-file-line-error',
	"     \   '-synctex=1',
	"     \   '-interaction=nonstopmode',
	"     \ ],
	"     \}
	"Plug 'kdheepak/cmp-latex-symbols'
	"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	  "let g:livepreview_previewer = 'open -a Preview'
	  "let g:livepreview_engine = 'xelatex' 
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	
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

if !exists('g:vscode')
  if g:sdubygui == 1
      set termguicolors
      colorscheme gruvbox
      source ~/.config/nvim/firenvim.vim
  else
      colorscheme dim
  endif
  lua require('lua-config')
else 
  lua require('vscode-config')
endif

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>pf :Telescope find_files<cr>
nnoremap <leader>/ :Telescope live_grep<cr>
nnoremap <leader><leader> :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>
nnoremap <leader>ft :Telescope tags<cr>
nnoremap <leader>pp :Telescope projects<cr>
" nmap <leader>g :Neogit<cr>
