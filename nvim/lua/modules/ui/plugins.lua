-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({ 'projekt0n/github-nvim-theme', priority = 99, config = conf.github })

plugin({ 'nvimdev/dashboard-nvim', config = conf.dashboard })

-- plugin({
--   'glepnir/galaxyline.nvim',
--   branch = 'main',
--   config = conf.galaxyline,
--   dependencies = 'kyazdani42/nvim-web-devicons',
-- })

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  dependencies = { 'kyazdani42/nvim-web-devicons' },
})

plugin({
  'akinsho/nvim-bufferline.lua',
  config = conf.nvim_bufferline,
  event = 'BufReadPost',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
})

plugin({
  'nvimdev/lspsaga.nvim',
  event = 'BufReadPost',
  config = conf.lspsaga,
})

plugin({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPost',
  config = function()
    require('indent_blankline').setup({
      show_current_context = true,
      show_current_context_start = true,
    })
  end,
})
