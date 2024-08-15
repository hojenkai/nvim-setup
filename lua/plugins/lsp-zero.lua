return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},

    {'L3MON4D3/LuaSnip'},     -- Required, snippet engine
  },
  config = function()
    local lsp = require('lsp-zero').preset({})
    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({buffer = bufnr})
    end)

    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = "codeium" } ,
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      },
    })
    lsp.setup()

    -- Python LSP
    require'lspconfig'.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              -- ignore = {'W391'},
              maxLineLength = 88
            }
          }
        }
      }
    })
  end
}
