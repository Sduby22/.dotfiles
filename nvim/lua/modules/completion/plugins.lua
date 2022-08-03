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
  config = conf.nvim_lsp,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'VimEnter',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-cmp', 'nvim-lspconfig' }},
    { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = { 'nvim-cmp', 'nvim-lspconfig' }},
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = { 'nvim-cmp', 'nvim-lspconfig' }},
    { 'dcampos/nvim-snippy', config = conf.snippy },
    { 'dcampos/cmp-snippy', after = {'nvim-cmp','nvim-snippy'} },
    { 'honza/vim-snippets', after = 'cmp-snippy' },

    { 'zbirenbaum/copilot-cmp', after = {'copilot.lua', 'nvim-cmp'}, module = "copilot_cmp" },
  },
})


plugin({
  "zbirenbaum/copilot.lua",
  event = {"VimEnter"},
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()
    end, 100)
  end,
})
