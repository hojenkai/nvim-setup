local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))

end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '<C-n>', '<Cmd>NvimTreeToggle<CR>', desc = 'Open neo tree' }
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        custom = {"^\\.git"}
      },
      view = {
        side = "right",
        width = 50
      },
      on_attach = my_on_attach,
    }
  end,
}
