-- LSP Configuration & Plugins
return {
  {
    -- Configurations for the Neovim LSP client
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for Neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = { window = { winblend = 0 } },
        },
      },

      -- Show function signature as you type
      { 'ray-x/lsp_signature.nvim', opts = { hint_enable = false } },
    },
    config = function()
      require('lsp_setup')
    end,
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = {
      'LspInfo',
      'LspInstall',
      'LspLog',
      'LspRestart',
      'LspStart',
      'Mason',
      'MasonInstall',
      'MasonLog',
      'MasonUpdate',
    },
  },

  -- Full signature help, docs and completion for the Neovim Lua API
  {
    'folke/lazydev.nvim',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
    ft = 'lua',
  },

  -- Typings for `vim.uv` used by lazydev
  { 'Bilal2453/luvit-meta', lazy = true },
}

-- vim: ts=2 sts=2 sw=2 et
