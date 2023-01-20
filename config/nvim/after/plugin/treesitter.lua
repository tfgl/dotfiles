local treesitter_sts, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_sts then return end

treesitter.setup {
  ensure_installed = {
    "help",
    "c",
    "cpp",
    "lua",
    "rust",
    "java",
    "javascript",
    "typescript"
  },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

