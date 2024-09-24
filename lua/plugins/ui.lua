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

  -- Make Neovim transparent
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {
      extra_groups = { 'NormalFloat' },
      exclude_groups = { 'Todo' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
