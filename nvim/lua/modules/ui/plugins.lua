-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({
  'yorik1984/newpaper.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('newpaper')
  end,
})
plugin({ 'nvimdev/dashboard-nvim', config = conf.dashboard })

-- plugin({
--   'glepnir/galaxyline.nvim',
--   branch = 'main',
--   config = conf.galaxyline,
--   dependencies = 'nvim-tree/nvim-web-devicons',
-- })

plugin({
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Neotree',
  keys = { { '<leader>e', ':Neotree toggle<CR>' } },
})

plugin({
  'akinsho/nvim-bufferline.lua',
  config = conf.nvim_bufferline,
  event = 'BufReadPost',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

-- plugin({
--   'nvimdev/lspsaga.nvim',
--   event = 'BufReadPost',
--   config = conf.lspsaga,
-- })

plugin({
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
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

plugin({
  'folke/todo-comments.nvim',
  event = 'BufReadPost',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
})

plugin({
  'kelly-lin/ranger.nvim',
  -- stylua: ignore
  keys = {
    { '<leader>o-', function() require('ranger-nvim').open(true) end },
  },
  opts = { replace_netrw = true },
})

plugin({ 'stevearc/dressing.nvim' })

plugin({
  'folke/trouble.nvim',
  event = 'BufReadPost',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
})
