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
          ['<C-c>'] = actions.smart_send_to_qflist + actions.open_qflist,
        },
        n = {
          ['<C-c>'] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = true },
      },
      sorting_strategy = 'ascending',
      -- file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      -- grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    pickers = {
      live_grep = {
        only_sort_text = true,
      },

      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = {
          'fd',
          '-H',
          '-E',
          '.git/',
          '-E',
          'node_modules/',
          '--type',
          'f',
          '--color',
          'never',
        },
      },
    },
    extensions = {
      ['zf-native'] = {
        -- options for sorting file-like items
        file = {
          -- override default telescope file sorter
          enable = true,

          -- highlight matching text in results
          highlight_results = true,

          -- enable zf filename match priority
          match_filename = true,
        },

        -- options for sorting all other items
        generic = {
          -- override default telescope generic item sorter
          enable = true,

          -- highlight matching text in results
          highlight_results = true,

          -- disable zf filename match priority
          match_filename = false,
        },
      },
      file_browser = {
        theme = 'ivy',
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
      },
      workspaces = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
      },
    },
  })
  require('telescope').load_extension('zf-native')
  require('telescope').load_extension('file_browser')
  require('telescope').load_extension('fuzzy_grep')
  require('telescope').load_extension('workspaces')
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

function config.formatter() end

function config.neogit()
  local neogit = require('neogit')
  neogit.setup({
    disable_insert_on_commit = 'auto',
    disable_builtin_notifications = true,
    disable_commit_confirmation = true,
    kind = 'tab',
    integrations = {
      telescope = true,
      diffview = true,
    },
  })
end

function config.diffview()
  local actions = require('diffview.actions')
  require('diffview').setup({
    keymaps = {
      file_panel = {
        ['<C-j>'] = ':',
      },
    },
  })
end

return config
