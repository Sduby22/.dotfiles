local vim_path = vim.fn.stdpath('config')
local ft_path = vim_path .. '/lua/core/ftplugin/'

local function get_ft_plugins_list()
  local list = {}
  local tmp = vim.split(vim.fn.globpath(ft_path, '*.lua'), '\n')
  for _, f in ipairs(tmp) do
    local ft = string.match(f, ft_path .. '(.+).lua$')
    list[#list + 1] = ft
  end
  return list
end

local function load_ft()
  local ft_list = get_ft_plugins_list()
  for _, ft in ipairs(ft_list) do
    vim.api.nvim_create_autocmd('FileType', {
      pattern = ft,
      callback = require('core.ftplugin.' .. ft),
    })
  end
end

load_ft()
