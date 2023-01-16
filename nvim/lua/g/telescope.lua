local M = {}
local DOTFILES = os.getenv("DOTFILES")

M.dotfiles = function()
  if not DOTFILES then
    print("env var DOTFILES undefined")
    return
  end
  require("telescope.builtin").find_files({
    cwd = DOTFILES
  })
end

return M
