-- Treesitter
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    require('treesitter_setup')
  end,
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall', 'TSPlaygroundToggle' },
}

-- vim: ts=2 sts=2 sw=2 et
