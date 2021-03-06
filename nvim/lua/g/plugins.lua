local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use 'mhinz/vim-startify'
  use 'preservim/nerdtree'

  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'crusoexia/vim-dream'
  use {'dracula/vim', as = 'dracula'}

  use {
    'SmiteshP/nvim-gps',
    config = function()
      require('nvim-gps').setup{}
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ryanoasis/vim-devicons'

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/playground'
  use 'tree-sitter/tree-sitter-cpp'
  use 'tree-sitter/tree-sitter-go'
  use 'theHamsta/tree-sitter-commonlisp'
  use 'ThePrimeagen/refactoring.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'Raimondi/delimitMate'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'mxw/vim-jsx'
  use 'williamboman/nvim-lsp-installer'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'noahfrederick/vim-composer'
  use 'noahfrederick/vim-laravel'

  use 'mfussenegger/nvim-jdtls'
  use 'mfussenegger/nvim-dap'

  use { "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require("dapui").setup({
        icons = { expanded = "???", collapsed = "???" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        --
        --[[
        sidebar = {
          -- You can change the order of elements in the sidebar
          elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
              id = "scopes",
              size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
          },
          size = 40,
          position = "left", -- Can be "left", "right", "top", "bottom"
        },
        tray = {
          elements = { "repl" },
          size = 10,
          position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        --]]
        layouts = {
          {
            elements = {
              'scopes',
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 40,
            position = 'left',
          },
          {
            elements = {
              'repl',
              'console',
            },
            size = 10,
            position = 'bottom',
          },
        },
        --
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
      })

      require('dapui').setup(
      )
    end
  }

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "LinArcX/telescope-command-palette.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  }
  use "elihunter173/dirbuf.nvim"

  use 'vim-test/vim-test'
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
