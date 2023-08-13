local plugin = require('core.pack').register_local_plugin

plugin({
  'format',
  event = 'BufReadPre',
  config = function()
    local format = require('format')
    format.setup({
      autoformat = true,
      format_notify = true,
      disabled_ft = { 'proto' },
    })

    vim.keymap.set('n', '<leader>cf', format.toggle, { silent = true })
    vim.keymap.set('n', '<leader>f.', format.format, { silent = true })
  end,
})

plugin({
  'image-paste',
  keys = {
    {
      '<A-v>',
      function()
        require('image-paste').paste_image()
      end,
    },
  },
  opts = {},
})
