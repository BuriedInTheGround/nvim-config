return {
  -- Use lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        globalstatus = true,
      },
    },
    event = 'VeryLazy',
  },

  -- Improve the default vim.ui interfaces
  {
    'stevearc/dressing.nvim',
    config = true,
    event = 'VeryLazy',
  },
}

-- vim: ts=2 sts=2 sw=2 et
