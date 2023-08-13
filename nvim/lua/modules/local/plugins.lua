local plugin = require('core.pack').register_local_plugin

plugin({
  'format',
  event = 'BufWritePre',
  keys = {
    { '<leader>cf', function() require('format').toggle() end },
    { '<leader>f.', function() require('format').format() end },
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
