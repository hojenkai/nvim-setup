return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup {
      options = {
        theme = 'tokyonight',
      },
      sections = {
	lualine_c = { 'buffers' },
      },
    }
  end,
}
