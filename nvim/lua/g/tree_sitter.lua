local ts_status, ts = pcall(require, 'nvim-treesitter.configs')
if not ts_status then
  return
end
local g = vim.g

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

-- TreeSitter
local tree_sitter_init = function()
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldmethod = "expr"

    g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
    ts.setup {
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
end

tree_sitter_init()
