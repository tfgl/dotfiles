local M = {}
local DOTFILES = os.getenv("DOTFILES")

M.dotfiles = function()
  if not DOTFILES then
    print("DOTFILES variable undefined")
    return
  end
  require("telescope.builtin").find_files({
    cwd = DOTFILES
  })
end

return M
