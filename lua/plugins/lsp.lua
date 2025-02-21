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

  -- Code actions with Telescope
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {
      backend = vim.fn.executable('delta') == 1 and 'delta' or 'vim',
      backend_opts = {
        delta = {
          args = {
            '--diff-highlight',
            '--line-numbers',
            '--line-numbers-minus-style=red',
            '--line-numbers-plus-style=green',
          },
        },
      },
      -- Disable icons
      signs = {
        quickfix = { '', { link = 'DiagnosticInfo' } },
        others = { '', { link = 'DiagnosticWarning' } },
        refactor = { '', { link = 'DiagnosticWarning' } },
        ['refactor.move'] = { '', { link = 'DiagnosticInfo' } },
        ['refactor.extract'] = { '', { link = 'DiagnosticError' } },
        ['source.organizeImports'] = { '', { link = 'TelescopeResultVariable' } },
        ['source.fixAll'] = { '', { link = 'TelescopeResultVariable' } },
        ['source'] = { '', { link = 'DiagnosticError' } },
        ['rename'] = { '', { link = 'DiagnosticWarning' } },
        ['codeAction'] = { '', { link = 'DiagnosticError' } },
      },
    },
    event = 'LspAttach',
  },
}

-- vim: ts=2 sts=2 sw=2 et
