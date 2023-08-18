local plugin = require('core.pack').register_local_plugin

plugin({
  'format',
  event = 'BufWritePre',
  keys = {
    {
      '<leader>cf',
      function()
        require('format').toggle_tab()
      end,
    },
    {
      '<leader>f.',
      function()
        require('format').format()
      end,
    },
  },
  config = function()
    local format = require('format')
    format.setup({
      autoformat = true,
      format_notify = true,
      disabled_ft = { 'proto' },
    })
  end,
})

plugin({
  'image-paste',
  config = function()
    local paste = require('image-paste')
    paste.setup()
    vim.keymap.set({ 'n', 'v', 's', 'x', 'o', 'i', 'l' }, '<A-v>', paste.paste_image, { noremap = true, silent = true })
  end,
})
