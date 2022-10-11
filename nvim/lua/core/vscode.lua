local vscode = vim.g.vscode ~= nil


local function null()
end


local function conditional_func(fn, mode)
    mode = mode or 'both'

    if mode == 'nvim' and vscode then
      return null
    end

    if mode == 'vscode' and not vscode then
      return null
    end

    return fn
end

return conditional_func
