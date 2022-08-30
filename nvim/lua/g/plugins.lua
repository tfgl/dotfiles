local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

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
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ryanoasis/vim-devicons'

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- syntax
  use "nvim-treesitter/nvim-treesitter"
  use 'nvim-treesitter/playground'
  use 'tree-sitter/tree-sitter-cpp'
  use 'tree-sitter/tree-sitter-go'
  use 'theHamsta/tree-sitter-commonlisp'
  use 'ThePrimeagen/refactoring.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'simrat39/rust-tools.nvim'

  use 'Raimondi/delimitMate'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'mxw/vim-jsx'
  use 'williamboman/nvim-lsp-installer'

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'

  use 'noahfrederick/vim-composer'
  use 'noahfrederick/vim-laravel'

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "LinArcX/telescope-command-palette.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use "theHamsta/nvim-dap-virtual-text"

  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  }
  -- use "elihunter173/dirbuf.nvim"

  -- use 'vim-test/vim-test'
  if packer_bootstrap then
    require("packer").sync()
  end
end)
