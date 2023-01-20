local lsp_sts, lsp = pcall(require, "lsp-zero")
if not lsp_sts then return end

lsp.preset("recommended")

lsp.ensure_installed({
  "sumneko_lua",
  "bashls",
  "jdtls",
  "html",
  "clangd",
  "dockerls",
  "rust_analyzer",
  "tsserver",
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

local isInspectModOn = false

local inspect = function()
  isInspectModOn = not isInspectModOn;
  if isInspectModOn then
    vim.lsp.buf.hover()
  else
    vim.diagnostic.open_float(nil, {focus=false});
  end
end

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>e", inspect, opts)

  vim.keymap.set("n", "<leader>cnn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>cne", function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR}) end, opts)
  vim.keymap.set("n", "<leader>cnw", function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN}) end, opts)
  vim.keymap.set("n", "<leader>cni", function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.INFO}) end, opts)
  vim.keymap.set("n", "<leader>cnh", function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.HINT}) end, opts)

  vim.keymap.set("n", "<leader>cpp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>cpe", function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR}) end, opts)
  vim.keymap.set("n", "<leader>cpw", function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN}) end, opts)
  vim.keymap.set("n", "<leader>cpi", function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.INFO}) end, opts)
  vim.keymap.set("n", "<leader>cph", function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.HINT}) end, opts)

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", {})

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
      buffer = bufnr,
      group = group,
      callback = function()
        isInspectModOn = false
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
        vim.diagnostic.open_float(nil, {focus=false})
      end,
    })
  end
end)

vim.cmd [[
 augroup filetype
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
   au BufRead,BufNewFile *.cup             set filetype=cup
 augroup END
 au Syntax jflex    so ~/.config/nvim/ftplugin/jflex.vim
 au Syntax cup      so ~/.config/nvim/ftplugin/cup.vim
]]

vim.cmd [[
 augroup filetype
   au BufRead,BufNewFile *.ks              set filetype=kerboscript
 augroup END
 au Syntax kerboscript    so ~/.config/nvim/ftplugin/kerboscript.vim
]]


lsp.setup()

vim.diagnostic.config({ virtual_text = true })
