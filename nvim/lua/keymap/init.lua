-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend plugins key defines in this file

require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

-- usage of plugins
nmap({
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader><leader>', cmd('Telescope find_files'), opts(noremap, silent) },

  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fr', cmd('Telescope oldfiles'), opts(noremap, silent) },
  { '<Leader>.', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>pf', cmd('Telescope find_files'), opts(noremap, silent) },
  
  { '<Leader>/', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>bb', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>pp', cmd('Telescope projects'), opts(noremap, silent) },
  { '<Leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
})

nmap({
  { 'gt', cmd("call VSCodeCall('editor.action.goToTypeDefinition')"), opts(noremap, silent) },
  { '<Leader><leader>', cmd("call VSCodeCall('workbench.action.quickOpen')"), opts(noremap, silent) },
  { '<Leader>ff', cmd("call VSCodeCall('workbench.action.quickOpen')"), opts(noremap, silent) },
  { '<Leader>pf', cmd("call VSCodeCall('workbench.action.quickOpen')"), opts(noremap, silent) },
  { '<Leader>.', cmd("call VSCodeCall('workbench.action.quickOpen')"), opts(noremap, silent) },
  { '<Leader>/', cmd("call VSCodeCall('workbench.view.search')"), opts(noremap, silent) },

  { '<Leader>ca', cmd("call VSCodeCall('editor.action.quickFix')"), opts(noremap, silent) },
  { '<Leader>cr', cmd("call VSCodeCall('editor.action.rename')"), opts(noremap, silent) },
  { '<Leader>cf', cmd("call VSCodeCall('formattingToggle.toggleFormat')"), opts(noremap, silent) },
  { '<Leader>cs', cmd("call VSCodeCall('editor.action.sourceAction')"), opts(noremap, silent) },
  { ']e', cmd("call VSCodeCall('editor.action.marker.nextInFiles')"), opts(noremap, silent) },
  { '[e', cmd("call VSCodeCall('editor.action.marker.prevInFiles')"), opts(noremap, silent) },
  { '<leader>z', cmd("call VSCodeCall('workbench.action.toggleZenMode')"), opts(noremap, silent) },

  { '<leader>wo', cmd("call VSCodeNotify('workbench.action.joinAllGroups')"), opts(noremap, silent) },
  { '<leader>wj', cmd("call VSCodeNotify('workbench.action.focusBelowGroup')"), opts(noremap, silent) },
  { '<leader>wk', cmd("call VSCodeNotify('workbench.action.focusAboveGroup')"), opts(noremap, silent) },
  { '<leader>wh', cmd("call VSCodeNotify('workbench.action.focusLeftGroup')"), opts(noremap, silent) },
  { '<leader>wl', cmd("call VSCodeNotify('workbench.action.focusRightGroup')"), opts(noremap, silent) },
  { '<leader>wJ', cmd("call VSCodeNotify('workbench.action.moveEditorToBelowGroup')"), opts(noremap, silent) },
  { '<leader>wI', cmd("call VSCodeNotify('workbench.action.moveEditorToAboveGroup')"), opts(noremap, silent) },
  { '<leader>wH', cmd("call VSCodeNotify('workbench.action.moveEditorToLeftGroup')"), opts(noremap, silent) },
  { '<leader>wL', cmd("call VSCodeNotify('workbench.action.moveEditorToRightGroup')"), opts(noremap, silent) },
  { '<leader>ww', cmd("call VSCodeNotify('workbench.action.focusNextGroup')"), opts(noremap, silent) },
  { '<leader>wW', cmd("call VSCodeNotify('workbench.action.focusPreviousGroup')"), opts(noremap, silent) },
  { '<leader>wq', cmd("call VSCodeNotify('workbench.action.closeActiveEditor')"), opts(noremap, silent) },
  { '<leader>wc', cmd("call VSCodeNotify('workbench.action.closeActiveEditor')"), opts(noremap, silent) },
  { '<leader>bk', cmd("call VSCodeNotify('workbench.action.closeActiveEditor')"), opts(noremap, silent) },
}, 'vscode')
