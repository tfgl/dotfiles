local def_opts = { noremap = true, silent = true }
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
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- misc
nmap("<leader>tl", ":set invrelativenumber invnumber<CR>")                  -- toggle line numbers
nmap("<leader>nh", ":nohlsearch<CR>")                                       -- hide search hilight
nmap("<leader>so", ":so %<CR>")
vmap("<leader>hh", "\"hy:help <C-r>h<Enter>")
nmap("<leader>u", ":UndotreeToggle<CR>")

-- dap
nmap("<Leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
nmap("<Leader>dn", ":lua require('dap').continue()<CR>")
nmap("<Leader>dr", ":lua require('dap').repl.toggle({}, 'vsplit')<CR>")
nmap("<Leader>dsi", ":lua require('dap').step_into()<CR>")
nmap("<Leader>dso", ":lua require('dap').step_over()<CR>")
nmap("<Leader>do", ":lua require('dapui').toggle()<CR>")
nmap("<Leader>td", ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>")

-- file operations
nmap("<leader>fs", ":w<CR>")                                                -- save file
nmap("<leader>fp", ":lua require('g.telescope').dotfiles()<CR>")            -- search dotfiles
nmap("<leader>oa", ":vs ~/Documents/neorg/agenda.norg<CR>")                 -- open agenda
nmap("<leader>os", ":vs ~/Documents/neorg/scratchbuff.norg<CR>")            -- open scratchbuff
nmap("<leader>ot", ":sp | te <CR>")                                         -- open terminal
nmap("<leader>oe", ":e ~/.config/nvim/init.lua<CR>")                        -- open init.lua
nmap("<leader>od", ":e ~/Documents/")                                       -- open Documents folder
nmap("<leader>sd", ":SessionManager delete_session<CR>")                    -- delete session

-- nav jump
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")
nmap("<C-h>", "4h")
nmap("<C-l>", "4l")
nmap("<C-j>", "ztM")
nmap("<C-k>", "zbM")
nmap("<C-n>", "<cmd>AerialNext<CR>")
nmap("<C-p>", "<cmd>AerialPrev<CR>")
nmap("<leader>ta", "<cmd>AerialToggle<CR>")
nmap("<leader>tt", ":TroubleToggle<CR>")
local leap_sts, leap = pcall(require, 'leap')
if leap_sts then leap.add_default_mappings() end

-- text manipulation
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")
vmap("<leader>p", "\"_dP")
nmap("<leader>rol", "viw\"hy:s/<C-r>h//g<left><left>")
nmap("<leader>ral", "viw\"hy:%s/<C-r>h//gc<left><left><left>")
vmap("<C-c>", "\"+y")
nmap("Y", "y$")

-- buffer
nmap("<leader>qq", ":q!<CR>")
nmap("<leader>qw", ":wq<CR>")
nmap("<leader>Q", ":qa<CR>")
nmap("<Up>", ":resize -2<CR>")
nmap("<Left>", ":vertical resize -2<CR>")
nmap("<Down>", ":resize +2<CR>")
nmap("<Right>", ":vertical resize +2<CR>")
nmap("<leader>zz", ":ZenMode<CR>")

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
nmap("<leader>wo", ":only<CR>")

-- git
nmap("<leader>gg", ":G<CR>")
nmap("<leader>gf", ":GFiles<CR>")
nmap("<leader>gb", ":Telescope git_branches<CR>")
nmap("<leader>gn", ":diffget //3<CR>")
nmap("<leader>go", ":diffget //2<CR>")
nmap("<leader>gcc", ":Git commit<CR>")
nmap("<leader>gca", ":lua require('g.ui_components').input('commit msg', function(value) vim.cmd('Git ac '..value) end)<CR>") -- commit all change

-- telescope
nmap("<leader>.", ":lua require('telescope.builtin').find_files()<CR>")
nmap("<leader>,", ":lua require('telescope.builtin').buffers()<CR>")
nmap("<leader>l", ":Telescope file_browser<CR>")
nmap("<leader>p", ":Telescope command_palette<CR>")
nmap("<leader>ts", ":Telescope treesitter<CR>")
nmap("<leader>fw", ":lua require('telescope.builtin').live_grep()<CR>")

imap("<M-2>", "é")
imap("<M-7>", "è")
imap("<M-.>", "ê")
imap("<M-9>", "ç")
imap("<M-0>", "à")
imap("<M-a>", "â")
imap("<M-o>", "ô")
imap("<M-u>", "û")
imap("<M-i>", "î")
imap("<S-M-i>", "ï")
imap("<M-->", "ù")

return {
  nmap = nmap,
  imap = imap,
  vmap = vmap,
}
