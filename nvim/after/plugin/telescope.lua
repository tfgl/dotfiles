local telescope = require('telescope')
local config = {}

config.extensions = {
  file_browser = {
    theme = "ivy",
    mappings = {
      ["i"] = {
        -- your custom insert mode mappings
      },
      ["n"] = {
        -- your custom normal mode mappings
      },
    },
  },
  command_palette = {
    {"File",
      { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
      { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
    },
    {"Help",
      { "tips", ":help tips" },
      { "cheatsheet", ":help index" },
      { "summary", ":help summary" },
      { "quick reference", ":help quickref" },
      { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
    },
    {"Vim",
      { "reload vimrc", ":source $MYVIMRC" },
      { 'check health', ":checkhealth" },
      { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
      { "commands", ":lua require('telescope.builtin').commands()" },
      { "command history", ":lua require('telescope.builtin').command_history()" },
      { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
      { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
      { "vim options", ":lua require('telescope.builtin').vim_options()" },
      { "keymaps", ":lua require('telescope.builtin').keymaps()" },
      { "buffers", ":Telescope buffers" },
      { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
      { "paste mode", ':set paste!' },
      { 'cursor line', ':set cursorline!' },
      { 'cursor column', ':set cursorcolumn!' },
      { "spell checker", ':set spell!' },
      { "relative number", ':set relativenumber!' },
      { "search highlighting (F12)", ':set hlsearch!' },
    },
    { "Theme",
      { "Tokyonight", ":lua SetTheme(THEMES.tokyonight)"},
      { "Dracula", ":lua SetTheme(THEMES.dracula)"},
    }
  }
}

config.defaults = {
  file_ignore_patterns = { "node_modules", ".ccls-cache", ".cache" },
  color_devicons = true
}

telescope.setup(config)
telescope.load_extension('command_palette')
telescope.load_extension('file_browser')

