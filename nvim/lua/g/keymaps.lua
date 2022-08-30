local g = vim.g
local def_opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

local keymaps = {v = {}, n = {}, i = {}}

local map = function(mod, remap, action, opts)
  if opts == nil then opts = def_opts end
  if keymaps[mod][remap] then
    print('waring: '..mod..'remap '..remap..' used already')
  end
  keymaps[mod][remap] = true
  keymap(mod, remap, action, opts)
end

local nmap = function(remap, action, opts)
  map("n", remap, action, opts)
end

local imap = function(remap, action, opts)
  map("i", remap, action, opts)
end

local vmap = function(remap, action, opts)
  map("v", remap, action, opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", def_opts)
g.mapleader = " "
g.maplocalleader = " "

-- theprimeagen refactor
vmap("<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vmap("<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vmap("<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vmap("<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- dap
nmap("<Leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
nmap("<Leader>dn", ":lua require('dap').continue()<CR>")
nmap("<Leader>dr", ":lua require('dap').repl.toggle({}, 'vsplit')<CR>")
nmap("<Leader>dsi", ":lua require('dap').step_into()<CR>")
nmap("<Leader>dso", ":lua require('dap').step_over()<CR>")
nmap("<Leader>do", ":lua require('dapui').toggle()<CR>")
nmap("<Leader>td", ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>")

nmap("<C-j>", "ztM")
nmap("<C-k>", "zbM")

nmap("<leader>wj", "<C-w>j")
nmap("<leader>wk", "<C-w>k")
nmap("<leader>wh", "<C-w>h")
nmap("<leader>wl", "<C-w>l")
nmap("<leader>wv", ":vs<CR>")
nmap("<leader>ws", ":sp<CR>")
nmap("<leader>wt", "gt")
nmap("<leader>wn", ":tabnew<CR>")
nmap("<leader>wc", ":q<CR>")
nmap("<leader>w=", "<C-w>=")
nmap("<leader>wf", ":tab split<CR>")
nmap("<leader>wo", ":only<CR>")

-- file operations
nmap("<leader>fs", ":w<CR>")                                                -- save file
nmap("<leader>fp", ":lua require('g.telescope').dotfiles()<CR>")            -- search dotfiles

nmap("<leader>oa", ":vs ~/Documents/neorg/agenda.norg<CR>")            -- open agenda
nmap("<Leader>oq", "copen<CR>")                                             -- open quickfixlist
nmap("<leader>os", ":vs ~/Documents/neorg/scratchbuff.norg<CR>")            -- open scratchbuff
nmap("<leader>ot", ":sp | te <CR>")                                         -- open terminal
nmap("<leader>oe", ":e ~/.config/nvim/init.lua<CR>")                        -- open init.lua
nmap("<leader>od", ":e ~/Documents/")                                       -- open Documents folder

nmap("<leader>tl", ":set invrelativenumber invnumber<CR>")                  -- toggle line numbers
nmap("<leader>tt", ":NERDTreeToggle<CR>")                                   -- toggle nerdtree

nmap("<leader>nh", ":nohlsearch<CR>")                                       -- hide search hilight

-- nav jump
nmap("<Leader>qn", ":cnext<CR>")                                            -- next item of quickfixlist
nmap("<Leader>qN", ":cprevious<CR>")                                        -- previous item of quickfixlist
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- resize
nmap("<Up>", ":resize -2<CR>")
nmap("<Left>", ":vertical resize -2<CR>")
nmap("<Down>", ":resize +2<CR>")
nmap("<Right>", ":vertical resize +2<CR>")

nmap("<leader>ral", "viw\"hy:%s/<C-r>h//gc<left><left><left>")
vmap("<leader>p", "\"_dP")

nmap("<leader>rol", "viw\"hy:s/<C-r>h//g<left><left>")

vmap("<C-c>", "\"+y")
nmap("Y", "y$")

nmap("<leader>H", ":%!xxd<CR>")
nmap("<leader>ss", ":SSave ")
nmap("<leader>so", ":so %<CR>")
nmap("<leader>qq", ":q!<CR>")
nmap("<leader>qw", ":wq<CR>")
nmap("<leader>qa", ":qa<CR>")
vmap("<leader>hh", "\"hy:help <C-r>h<Enter>")
nmap("<leader>n", ":nohlsearch<CR>")
nmap("<leader>bo", ":%bd|e#<CR>")
nmap("<leader>gg", ":G<CR>")
nmap("<leader>gf", ":GFiles<CR>")
nmap("<leader>gn", ":diffget //3<CR>")
nmap("<leader>go", ":diffget //2<CR>")
nmap("<leader>gcs", ":GCheckout<CR>")
nmap("<leader>gcc", ":Git commit<CR>")

-- code
nmap("<leader>cd", ":lua vim.lsp.buf.definition()<CR>")
nmap("<leader>cf", ":lua vim.lsp.buf.references()<CR>")
nmap("<leader>cr", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
nmap("<leader>cc", ":make<CR>:copen<CR>")

-- telescope
nmap("<leader>.", ":lua require('telescope.builtin').find_files()<CR>")
nmap("<leader>,", ":lua require('telescope.builtin').buffers()<CR>")
nmap("<leader>l", ":Telescope file_browser<CR>")
nmap("<leader>p", ":Telescope command_palette<CR>")
nmap("<leader>ts", ":Telescope treesitter<CR>")
nmap("<leader>fw", ":lua require('telescope.builtin').live_grep()<CR>")

imap("<M-2>", "é")
imap("<M-7>", "è")
imap("<M-9>", "ç")
imap("<M-0>", "à")
imap("<M-->", "ù")

vim.cmd[[
  imap <expr> <tab> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<tab>"
  imap <expr> <S-tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"    : "<C-tab>"
]]

local M = {nmap = nmap, imap = imap, vmap = vmap}
return M
