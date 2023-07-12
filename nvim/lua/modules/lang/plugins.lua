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

plugin({
  'nvim-treesitter/nvim-treesitter-textobjects',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
})

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
  event = 'BufWritePre',
  dependencies = { 'nvim-lua/plenary.nvim' },
})

plugin({
  event = 'BufWritePre',
  'lukas-reineke/lsp-format.nvim',
})

plugin({
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  ft = { 'norg' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neorg').setup({
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/org',
            },
          },
        },
      },
    })
  end,
})
