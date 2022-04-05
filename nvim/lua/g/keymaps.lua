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

nmap("<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
nmap("<leader>fs", ":w<CR>")
nmap("<leader>fp", ":lua require('g.telescope').dotfiles()<CR>")
nmap("<leader>fts", ":set ft=sh<CR>")

nmap("<leader>ot", ":sp | te <CR>")
nmap("<leader>os", ":vs ~/Documents/neorg/scratchbuff.norg<CR>")
nmap("<leader>oe", ":e ~/.config/nvim/init.lua<CR>")

nmap("<leader>tl", ":set invrelativenumber invnumber<CR>")

nmap("<leader>nh", ":nohlsearch<CR>")

-- nav jump
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

vmap("<leader>r", "\"hy:%s/<C-r>h//gc<left><left><left>")
vmap("<leader>p", "\"_dP")

nmap("<M-x>", ":")
vmap("<C-c>", "\"+y")
nmap("Y", "y$")

nmap("<leader>H", ":%!xxd<CR>")
nmap("<leader>ss", ":mksession .session.vim<CR>")
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

nmap("<leader>cd", ":lua vim.lsp.buf.definition()<CR>")
nmap("<leader>cf", ":lua vim.lsp.buf.references()<CR>")
nmap("<leader>cr", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")

-- telescope
nmap("<leader>.", ":lua require('telescope.builtin').find_files()<CR>")
nmap("<leader>,", ":lua require('telescope.builtin').buffers()<CR>")

-- Nredtree
nmap("<leader>'", ":NERDTreeToggle<CR>")

imap("<M-2>", "é")
imap("<M-7>", "è")
imap("<M-9>", "ç")
imap("<M-0>", "à")
imap("<M-->", "ù")


local M = {nmap = nmap, imap = imap, vmap = vmap}
return M
