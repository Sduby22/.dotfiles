-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  -- ft = conf.lsp_ft,
  event = 'BufReadPost',
  config = conf.nvim_lsp,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'FelipeLema/cmp-async-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    {
      'L3MON4D3/cmp-luasnip-choice',
      config = function()
        require('cmp_luasnip_choice').setup({
          auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
        })
      end,
      dependencies = {
        { 'saadparwaiz1/cmp_luasnip' },
        {
          'L3MON4D3/LuaSnip',
          version = '2.*',
          build = 'make install_jsregexp',
          dependencies = { 'honza/vim-snippets' },
          config = conf.lua_snip,
        },
      },
    },
  },
})

-- plugin({
--   'windwp/nvim-autopairs',
--   event = 'InsertEnter',
--   config = conf.nvim_autopairs,
-- })

plugin({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.nvim_autopairs,
})

plugin({
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    local opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = {
          position = 'bottom', -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = false,
          prev = false,
          dismiss = false,
        },
      },
      filetypes = {
        markdown = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    }

    require('copilot').setup(opts)
    vim.keymap.set('i', '<Tab>', function()
      if require('copilot.suggestion').is_visible() then
        require('copilot.suggestion').accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
      end
    end, { desc = 'Super Tab' })
  end,
})

-- plugin({
--   "zbirenbaum/copilot.lua",
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup()
--     end, 100)
--   end,
-- })
