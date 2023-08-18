-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({
  'yorik1984/newpaper.nvim',
  priority = 1000,
  -- dependencies = { 'yorik1984/lualine-theme.nvim' },
  config = function()
    require('newpaper').setup({
      style = 'dark',
    })
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
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Neotree',
  keys = { { '<leader>e', ':Neotree toggle reveal<CR>' } },
})

-- plugin({
--   'akinsho/nvim-bufferline.lua',
--   config = conf.nvim_bufferline,
--   event = 'BufReadPost',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
-- })

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
    {
      'rcarriga/nvim-notify',
      opts = {
        render = 'compact',
        stages = 'static',
      },
    },
  },
})

plugin({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPost',
  opts = {},
})

plugin({
  'echasnovski/mini.indentscope',
  version = '*',
  event = 'BufReadPost',
  config = function()
    local m = require('mini.indentscope')
    m.setup({
      draw = {
        delay = 0,
        animation = m.gen_animation.none(),
      },
      symbol = '│',
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
  'theniceboy/joshuto.nvim',
  -- stylua: ignore
  keys = {
    { '<leader>o-', function() require('joshuto').joshuto() end },
  },
})

plugin({ 'stevearc/dressing.nvim' })

plugin({
  'folke/trouble.nvim',
  event = 'BufReadPost',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
})

plugin({ 'SmiteshP/nvim-navic', dependencies = { 'neovim/nvim-lspconfig' }, event = 'BufReadPost', opts = {} })
plugin({
  'SmiteshP/nvim-navbuddy',
  keys = {
    { '<leader>s', ':Navbuddy<CR>' },
  },
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = {},
})

plugin({ 'fgheng/winbar.nvim', opts = {}, event = 'BufReadPost' })

plugin({ 'monkoose/matchparen.nvim', event = 'BufReadPost', opts = {} })
plugin({ 'echasnovski/mini.cursorword', event = 'BufReadPost', opts = {} })
plugin({
  'akinsho/toggleterm.nvim',
  version = '*',
  config = conf.toggleterm,
})

plugin({
  'norcalli/nvim-colorizer.lua',
  opts = {
    'css',
    'javascript',
    'html',
    'typescript',
    'typescriptreact',
    'javascriptreact',
  },
})

plugin({
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    local rainbow_delimiters = require('rainbow-delimiters')

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        commonlisp = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
      blacklist = { 'c', 'cpp' },
    }
  end,
})

-- plugin({
--   '3rd/image.nvim',
--   config = function()
--     require('image').setup({
--       backend = 'kitty',
--       integrations = {
--         markdown = {
--           enabled = true,
--           sizing_strategy = 'auto',
--           download_remote_images = true,
--           clear_in_insert_mode = false,
--         },
--         neorg = {
--           enabled = true,
--           download_remote_images = true,
--           clear_in_insert_mode = false,
--         },
--       },
--       max_width = nil,
--       max_height = nil,
--       max_width_window_percentage = nil,
--       max_height_window_percentage = 50,
--       kitty_method = 'normal',
--       kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
--       window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
--       window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
--     })
--   end,
-- })

plugin({
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = conf.lualine,
})
