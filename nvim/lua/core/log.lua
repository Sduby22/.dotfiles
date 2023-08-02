local M = {}

function M.info(str)
  vim.api.nvim_notify(str, vim.log.levels.INFO, {})
end

function M.warn(str)
  vim.api.nvim_notify(str, vim.log.levels.WARN, {})
end

function M.error(str)
  vim.api.nvim_notify(str, vim.log.levels.ERROR, {})
end

return M
