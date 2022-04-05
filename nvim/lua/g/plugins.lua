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
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  use 'mfussenegger/nvim-jdtls'

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".ccls-cache" },
          color_devicons = true
        }
      })
    end
  }
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- workflow
  use 'SirVer/ultisnips'

  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {
            config = {
              icons = {
                todo = {
                  enabled = true,

                  done = {
                    enabled = true,
                    icon = ""
                  },
                  pending = {
                    enabled = true,
                    icon = ""
                  },
                  uncertain = {
                    enabled = true,
                    icon = "?"
                  },
                  on_hold = {
                    enabled = true,
                    icon = ""
                  }
                }
              }
            }
          }, -- Allows for use of icons
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
            }
          },
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/Documents/neorg"
              }
            }
          }
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  }

  --[[
  use {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({
        -- Animation style (see below for details)
        stages = "fade_in_slide_out",

        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,

        -- Function called when a window is closed
        on_close = nil,

        -- Render function for notifications. See notify-render()
        render = "default",

        -- Default timeout for notifications
        timeout = 5000,

        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
        background_colour = "Normal",

        -- Minimum width for notification windows
        minimum_width = 50,

        -- Icons for the different levels
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
    end
  }
  --]]

  use 'vim-test/vim-test'
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
