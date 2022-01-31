local opt = vim.opt
local cmd = vim.cmd
local HOME = require('os').getenv('HOME')

cmd('syntax on')
cmd('filetype plugin on')

opt.cp              = false			                  -- full vim
opt.swapfile        = false                       --
opt.backup          = false                       --
opt.wrap            = false                       --
opt.number          = true 			                  -- line number
opt.relativenumber  = true                        -- relative numbers
opt.linebreak       = true			                  --  word wrap
opt.expandtab       = true                        -- convert tab to spaces
opt.smartindent     = true		                    -- auto indent
opt.hls             = true                        -- highlight search
opt.is              = true                        -- show highlight while typing
opt.incsearch       = true			                  -- highlight search
opt.undofile        = true                        --

opt.tabstop         = 2				                    -- indent 2
opt.shiftwidth      = 2				                    -- indent 2

opt.completeopt     = 'menu,menuone,preview'      -- completian, popup menu and preview
opt.scrolloff       = 8                           -- lines to keep above and below the cursor
opt.undodir         = HOME..'/.cache/vim/undodir' --
opt.rtp[#opt.rtp+1] = '/usr/share/vim/vimfiles'   --
opt.rtp[#opt.rtp+1] = HOME..'/.config/nvim/'      --
