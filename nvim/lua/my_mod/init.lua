local M = {}

M.pop = function ()
    local width = vim.api.nvim_win_get_width(0) - 4
    local height = vim.api.nvim_win_get_height(0) - 4

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, false, {relative='editor', row=2, col=2, width=width, height=height})
end

return M
