-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  -- ft = conf.lsp_ft,
  event = 'BufReadPost',
  config = conf.nvim_lsp,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'dcampos/nvim-snippy', config = conf.snippy },
    { 'dcampos/cmp-snippy' },
    { 'honza/vim-snippets' },
  },
})

plugin({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.nvim_autopairs,
})

plugin({
  'github/copilot.vim',
  event = 'InsertEnter',
})

-- plugin({
--   "zbirenbaum/copilot.lua",
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup()
--     end, 100)
--   end,
-- })
