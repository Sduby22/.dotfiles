-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({ 'projekt0n/github-nvim-theme', config = conf.github })

plugin({ 'glepnir/dashboard-nvim', config = conf.dashboard })

-- plugin({
--   'glepnir/galaxyline.nvim',
--   branch = 'main',
--   config = conf.galaxyline,
--   requires = 'kyazdani42/nvim-web-devicons',
-- })

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({ 'akinsho/nvim-bufferline.lua', config = conf.nvim_bufferline, requires = 'kyazdani42/nvim-web-devicons' })

plugin({
  'nvimdev/lspsaga.nvim',
  config = conf.lspsaga,
  after = 'nvim-lspconfig',
})
