-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.telescope()
  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<C-h>'] = 'which_key',
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
      },
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  -- require('telescope').load_extension('projects')
end

function config.project()
  require('project_nvim').setup({})
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { text = '+' },
      change = { text = '=' },
      delete = { text = '-' },
      topdelete = { text = '-' },
      changedelete = { text = '-' },
      untracked = { text = '?' },
    },
  })
end

function config.comment()
  require('Comment').setup()
end

function config.formatter() end

function config.neogit()
  local neogit = require('neogit')
  neogit.setup({
    integrations = {
      diffview = true,
    },
  })
end

function config.diffview()
  local actions = require('diffview.actions')
  require('diffview').setup({
    keymaps = {
      view = {
        ['<C-j>'] = ']c',
        ['<C-k>'] = '[c',
      },
      file_panel = {},
    },
  })
end

return config
