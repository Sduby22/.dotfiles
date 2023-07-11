-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({ 'gpanders/editorconfig.nvim', event = 'BufReadPre' })
-- plugin({'lewis6991/gitsigns.nvim', event='BufReadPre', config=conf.gitsigns})
plugin({ 'wakatime/vim-wakatime', event = 'InsertEnter' })
plugin({ 'numToStr/Comment.nvim', event = 'InsertEnter', config = conf.comment }, 'both')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/popup.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', lazy = true },
    -- { 'ahmedkhalf/project.nvim', config=conf.project },
  },
})

plugin({ 'mg979/vim-visual-multi', event = 'BufReadPost' }, 'both')
plugin({ 'tpope/vim-surround', event = 'BufReadPost' }, 'both')
plugin({ 'justinmk/vim-sneak', event = 'BufReadPost' }, 'both')

-- plugin({ 'Sduby22/fcitx.nvim', config=function() require('fcitx').setup() end }, 'both')
plugin({
  'tpope/vim-fugitive',
})

plugin({ 'NeogitOrg/neogit', dependencies = { 'nvim-lua/plenary.nvim' }, config = conf.neogit, cmd = 'Neogit' })
-- plugin({ 'sindrets/diffview.nvim', config = conf.diffview })
plugin({ 'sindrets/diffview.nvim', config = conf.diffview, lazy = true })

plugin({
  'glepnir/dbsession.nvim',
  config = function()
    require('dbsession').setup({
      auto_save_on_exit = true,
    })
  end,
})
