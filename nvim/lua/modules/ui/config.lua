-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}
local use_color = true
vim.opt.termguicolors = false

function config.lspsaga()
  local saga = require('lspsaga')
  saga.setup({
    move_in_saga = { prev = '<C-k>', next = '<C-j>' },
  })
end

function config.zephyer()
  vim.g.material_style = 'oceanic'
  load_colorscheme('material')
end

function config.material()
  vim.g.material_style = 'oceanic'
  load_colorscheme('material')
end

function config.github()
  -- if (use_color) then
  vim.opt.termguicolors = true
  vim.cmd('colorscheme github_light')
  -- end
end

function config.nord()
  load_colorscheme('nord')
end

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.setup({
    theme = 'doom',
    config = {
      -- header = {}, --your header
      center = {
        {
          icon = ' ',
          icon_hl = 'Load',
          desc = 'Load Last Session',
          desc_hl = 'String',
          key = 'l',
          key_hl = 'Number',
          action = 'ScopeLoadState',
        },
      },
      -- footer = {}, --your footer
    },
  })
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
  })
end

function config.load_colorscheme(color)
  print(color)
  if use_color then
    vim.opt.termguicolors = true
    vim.cmd('colorscheme ' .. color)
  end
end

function config.toggleterm()
  local Terminal = require('toggleterm.terminal').Terminal
  local fish = Terminal:new({
    cmd = 'fish',
    on_open = function()
      vim.cmd('startinsert!')
    end,
  })
  vim.keymap.set({ 'n', 'v', 't', 'i', 'c', 'o', 's' }, '<C-t>', function()
    fish:toggle()
  end)
end

return config
