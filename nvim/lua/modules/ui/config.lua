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
  db.session_directory = home .. '/.cache/nvim/session'
  db.preview_command = 'cat'
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 18
  db.preview_file_width = 103
  db.custom_center = {
    {
      icon = '  ',
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action = 'PackerUpdate',
    },
    {
      icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
  }
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

return config
