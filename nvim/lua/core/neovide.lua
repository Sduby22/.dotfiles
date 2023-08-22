local keymap = require('core.keymap')
local silent, noremap, expr = keymap.silent, keymap.noremap, keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd
local nmap, imap, cmap, xmap, omap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.omap, keymap.tmap

vim.o.guifont = 'Sarasa Term SC Nerd:h17' -- text below applies for VimScript
-- vim.g.neovide_hide_mouse_when_typing = true

vim.opt.linespace = 0
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_input_use_logo = true

-- vim.keymap.set('n', '<D-s>', function() vim.cmd('w') end) -- Save
-- vim.keymap.set('v', '<D-c>', '"+y') -- Copy
-- vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
-- vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
-- vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
-- vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

local function paste()
  local reg = vim.fn.getreg('+')
  vim.api.nvim_feedkeys(reg, 'n', true)
end

-- all modes
vim.keymap.set({ '!', 't' }, '<D-v>', paste)
vim.keymap.set({ 'v' }, '<D-v>', 'p')

nmap({
  { '<D-l>', cmd('bn'), opts(noremap) },
  { '<D-h>', cmd('bp'), opts(noremap) },
  { '<D-s>', cmd('write'), opts(noremap) },
  { '<D-w>', cmd('bd'), opts(noremap) },
})
