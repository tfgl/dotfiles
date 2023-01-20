local M = {}
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

M.input = function(title, callback)
  local input = Input({
    position = "50%",
    size = {
      width = 20,
    },
    border = {
      style = "single",
      text = {
        top = title,
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    prompt = "> ",
    on_submit = function(value)
      callback(value)
    end,
  })

  input:map("n", "q", "<cmd>q<CR>")
  input:map("n", "<esc>", "<cmd>q<CR>")

  input:mount()

  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

return M
