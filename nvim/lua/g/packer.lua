vim.cmd [[packadd packer.nvim]]

local packer = require'packer'

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- THEMES & UI
  use 'goolord/alpha-nvim'
  use 'folke/tokyonight.nvim'
  use {'dracula/vim', as = 'dracula'}
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'folke/which-key.nvim'
  use 'folke/zen-mode.nvim'

  -- GIT & HISTORY
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'mbbill/undotree'

  -- LSP & TREESITTER
  use ("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
  use 'nvim-treesitter/playground'
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- AUTOCOMPLETION
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- SNIPPETS
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
    }
  }

  -- TELESCOPE
  use "nvim-telescope/telescope.nvim"
  use 'nvim-lua/plenary.nvim'
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "LinArcX/telescope-command-palette.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use "theHamsta/nvim-dap-virtual-text"

  -- NAV
  use 'ggandor/leap.nvim'
  use 'stevearc/aerial.nvim'
  use 'folke/trouble.nvim'
end)
