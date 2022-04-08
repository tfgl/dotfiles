local lsp_status, lsp = pcall(require, 'lspconfig')
local lsp_installer_status, lsp_installer = pcall(require, 'nvim-lsp-installer')
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not lsp_status or not lsp_installer_status or not cmp_nvim_lsp_status then
  return
end

local init_lsp_servers = function()
  local servers = {
    "sumneko_lua",
    "bashls",
    "jdtls",
    "html",
    "clangd",
    "gopls",
    "tsserver"
  }
  local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

  for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
      lsp[name].setup { capabilities = capabilities }
      if not server:is_installed() then
        print("Installing " .. name)
        server:install()
      end
    end
  end

  lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local opts = {}
    if server.name == "sumneko_lua" then
      opts = {
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim', 'use'}
            }
          }
        }
      }
    end
    server:setup(opts)
  end)
end

init_lsp_servers()

vim.cmd [[
 augroup filetype                                                     
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
   au BufRead,BufNewFile *.cup             set filetype=cup
 augroup END                                                          
 au Syntax jflex    so ~/.config/nvim/ftplugin/jflex.vim
 au Syntax cup    so ~/.config/nvim/ftplugin/cup.vim
]]
