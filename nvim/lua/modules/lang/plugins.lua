-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  config = conf.nvim_treesitter,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', event = { 'BufReadPost', 'BufNewFile' } })

plugin({
  'simrat39/rust-tools.nvim',
  ft = { 'rust' },
  config = conf.rust_tools,
})

plugin({
  'p00f/clangd_extensions.nvim',
  ft = { 'c', 'cpp' },
  config = conf.clangd_extensions,
})

plugin({
  'jose-elias-alvarez/null-ls.nvim',
  config = conf.null_ls,
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
})

plugin({
  lazy = true,
  'lukas-reineke/lsp-format.nvim',
})
