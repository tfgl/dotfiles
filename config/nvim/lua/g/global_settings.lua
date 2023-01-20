local HOME = require('os').getenv('HOME')

vim.opt.swapfile            = false                       --
vim.opt.backup              = false                       --
vim.opt.wrap                = false                       -- no wrap
vim.opt.number              = true 			                  -- line number
vim.opt.relativenumber      = true                        -- relative numbers
vim.opt.linebreak           = true			                  --  word wrap
vim.opt.expandtab           = true                        -- convert tab to spaces
vim.opt.smartindent         = true		                    -- auto indent
vim.opt.hls                 = true                        -- highlight search
vim.opt.is                  = true                        -- show highlight while typing
vim.opt.incsearch           = true			                  -- highlight search
vim.opt.undofile            = true                        -- undo history

vim.opt.tabstop             = 2				                    -- indent 2
vim.opt.shiftwidth          = 2				                    -- indent 2

vim.opt.completeopt         = 'menu,menuone,noselect'     -- completion, popup menu and preview
vim.opt.scrolloff           = 8                           -- lines to keep above and below the cursor
vim.opt.undodir             = HOME..'/.cache/vim/undodir' -- undodir location
vim.opt.rtp[#vim.opt.rtp+1] = '/usr/share/vim/vimfiles'   -- vim files location
vim.opt.rtp[#vim.opt.rtp+1] = HOME..'/.config/nvim/'      -- vim files location

vim.opt_global.mouse        = 'a'
vim.g.termdebug             = '/usr/bin/gdb'
vim.o.timeoutlen            = 500                         -- key sequence timeout

vim.o.fillchars            = 'eob: ,vert: ,fold: '        -- remove annoying characters
