-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

--plugin({'gpanders/editorconfig.nvim', event='BufReadPre'})
--plugin({'lewis6991/gitsigns.nvim', event='BufReadPre', config=conf.gitsigns})
plugin({'wakatime/vim-wakatime', event='InsertEnter'})
plugin({'numToStr/Comment.nvim', event='InsertEnter', config=conf.comment})

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
    { 'ahmedkhalf/project.nvim', config=conf.project },
  },
})

plugin({ 'mg979/vim-visual-multi', event='InsertEnter' })
plugin({ 'tpope/vim-surround', event='InsertEnter' })
plugin({ 
  'windwp/nvim-autopairs', 
  config=conf.nvim_autopairs,
  after='nvim-cmp'
})
