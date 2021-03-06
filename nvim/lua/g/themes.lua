local g = vim.g

g.gitgutter_sign_added              = '█'
g.gitgutter_sign_modified           = '█'
g.gitgutter_sign_removed            = '█'
g.gitgutter_sign_removed_first_line = '█'
g.gitgutter_sign_modified_removed   = '█'
g.tokyonight_style = "night"

vim.cmd[[
    colorscheme dracula
    autocmd VimEnter * hi Normal ctermbg=none
    autocmd VimEnter * hi Folded ctermbg=none
]]
