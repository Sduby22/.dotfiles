-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
local config = {}
local use_color = true
local log = require('core.log')
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
      always_show_bufferline = true,
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
  require('toggleterm').setup({
    autochdir = true,
    on_open = function()
      vim.cmd('startinsert!')
    end,
  })
  local Terminal = require('toggleterm.terminal').Terminal
  local terminals = {}
  for i = 1, 10, 1 do
    terminals[i] = Terminal:new({
      cmd = 'fish',
    })
  end

  vim.keymap.set({ 'n', 'v', 't', 'i', 'c', 'o', 's' }, '<C-t>', function()
    local tabnr = vim.fn.tabpagenr()
    terminals[tabnr]:toggle()
  end, { noremap = true, silent = true })
end

local function get_tab_name(tabnr)
  local set_tabname = vim.t[tabnr].tabname
  if set_tabname == nil or set_tabname == '' then
    local tabcwd = vim.fn.getcwd(-1, tabnr)
    local parts = vim.split(tabcwd, '/')
    return parts[#parts]
  end
  return set_tabname
end

local function change_curr_tab_name()
  local current_tabnr = vim.fn.tabpagenr()
  vim.t.tabname = vim.ui.input({
    prompt = 'Tab name: ',
    default = get_tab_name(current_tabnr),
  }, function(name)
    if name == nil then
      return
    end
    vim.t[current_tabnr].tabname = name
    require('lualine').refresh({
      place = { 'statusline' },
    })
  end)
end

vim.keymap.set('n', '<leader><tab>,', change_curr_tab_name, { noremap = true, silent = true })

function config.lualine()
  local lualine = require('lualine')
  lualine.setup({
    options = {
      theme = 'newpaper',
      -- empty with newpaper colorscheme
      globalstatus = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      refresh = {
        statusline = -1,
        tabline = -1,
        winbar = -1,
      },
    },
    sections = {
      lualine_a = {
        {
          '',
          draw_empty = true,
          fmt = function()
            return ''
          end,
        },
      },
      lualine_b = {
        {
          'macro',
          fmt = function()
            return ''
          end,
          color = function()
            local recording_register = vim.fn.reg_recording()
            if recording_register == '' then
              return ''
            else
              return { bg = '#4989cd', fg = '' }
            end
          end,
        },
        'branch',
        'diff',
      },
      lualine_c = {
        { 'filename', path = 1 },
        -- {
        --   'navic',
        --   fmt = function()
        --     return require('nvim-navic').get_location()
        --   end,
        --   color = 'gray',
        -- },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          'tabs',
          mode = 2,
          fmt = function(name, context)
            local tabnr = context.tabnr
            return get_tab_name(tabnr)
          end,
        },
      },
    },
    tabline = {
      lualine_a = {
        { 'buffers', padding = 2 },
      },
      lualine_z = {},
    },
  })

  local refresh = function()
    lualine.refresh({
      place = { 'statusline' },
    })
  end

  vim.api.nvim_create_autocmd('RecordingEnter', {
    callback = refresh,
  })

  vim.api.nvim_create_autocmd('RecordingLeave', {
    callback = function()
      local timer = vim.loop.new_timer()
      timer:start(50, 0, vim.schedule_wrap(refresh))
    end,
  })
end

return config
