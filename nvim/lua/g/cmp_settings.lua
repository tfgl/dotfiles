local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  return
end

-- Global setup.
local cmp_init = function()
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = function (fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<C-p>'] = function (fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'snippy' }, -- For snippy users.
      -- { name = 'neorg' },
    }, {
      { name = 'buffer' },
    })
  })

-- `/` cmdline setup.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

-- `:` cmdline setup.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

cmp_init()
