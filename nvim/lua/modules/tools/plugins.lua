-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({ 'gpanders/editorconfig.nvim', event = 'BufReadPre' })
plugin({ 'lewis6991/gitsigns.nvim', event = 'BufReadPost', config = true })
plugin({ 'wakatime/vim-wakatime', event = 'InsertEnter' })
plugin({
  'echasnovski/mini.comment',
  event = 'BufReadPost',
  opts = {
    options = {
      custom_commentstring = function()
        return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
}, 'both')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/popup.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    -- { 'ahmedkhalf/project.nvim', config=conf.project },
  },
})

plugin({
  'nvim-telescope/telescope-file-browser.nvim',
  requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  lazy = true,
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
plugin({ 'sindrets/diffview.nvim', config = conf.diffview, lazy = true, cmd = { 'DiffviewOpen', 'DiffviewFileHistory' } })

plugin({
  'glepnir/dbsession.nvim',
  config = function()
    require('dbsession').setup({
      auto_save_on_exit = true,
    })
  end,
})

plugin({
  'echasnovski/mini.bufremove',
  version = '*',
  keys = {
    {
      '<leader>bk',
      function()
        require('mini.bufremove').delete(0, false)
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>bK',
      function()
        require('mini.bufremove').delete(0, true)
      end,
      desc = 'Delete Buffer (Force)',
    },
  },
})

plugin({
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'Spectre' },
})

plugin({
  'gabrielpoca/replacer.nvim',
  keys = {
    {
      '<C-e>',
      function()
        require('replacer').run()
      end,
    },
  },
})
