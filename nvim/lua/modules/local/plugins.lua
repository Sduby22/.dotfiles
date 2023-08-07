local plugin = require('core.pack').register_local_plugin

plugin({
  'format',
  event = 'BufWritePre',
  opts = {
    autoformat = true,
    format_notify = true,
    disabled_ft = { 'proto' },
  },
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
