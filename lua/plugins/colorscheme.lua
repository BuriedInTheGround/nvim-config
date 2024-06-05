return {
  -- Perpetua
  {
    'perpetuatheme/nvim',
    lazy = false, -- load main colorscheme during startup
    config = function()
      vim.cmd.colorscheme('perpetua')
    end,
    priority = 1000, -- load before all the other start plugins
  },

  -- Catppuccin
  { 'catppuccin/nvim', name = 'catppuccin', lazy = true },

  -- Gruvbox
  { 'ellisonleao/gruvbox.nvim', lazy = true },

  -- Mellow
  { 'mellow-theme/mellow.nvim', lazy = true },

  -- Nordic
  { 'AlexvZyl/nordic.nvim', lazy = true },

  -- Oxocarbon
  { 'nyoom-engineering/oxocarbon.nvim', lazy = true },

  -- Tokyonight
  { 'folke/tokyonight.nvim', lazy = true },
}

-- vim: ts=2 sts=2 sw=2 et
