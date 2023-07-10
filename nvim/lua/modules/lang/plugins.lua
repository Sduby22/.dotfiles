-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  -- event = 'BufReadPre',
  -- after = 'telescope.nvim',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

plugin({
  'simrat39/rust-tools.nvim',
  ft = { 'rust' },
  after = 'nvim-lspconfig',
  config = conf.rust_tools,
})

plugin({
  'p00f/clangd_extensions.nvim',
  ft = { 'c', 'cpp' },
  after = 'nvim-lspconfig',
  config = conf.clangd_extensions,
})

plugin({
  'jose-elias-alvarez/null-ls.nvim',
  config = conf.null_ls,
  requires = { 'nvim-lua/plenary.nvim' },
})

plugin({
  'lukas-reineke/lsp-format.nvim',
})
