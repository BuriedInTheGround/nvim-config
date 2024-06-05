-- Autocompletion
return {
  -- Completion engine
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet engine and its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        -- Snippets collection for many programming languages
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      build = (function()
        -- This build step is required for regex support in snippets. This is
        -- not supported in many Windows environments, so it is ignored there.
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- Completion capabilities
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    require('cmp_setup')
  end,
  event = 'InsertEnter',
}

-- vim: ts=2 sts=2 sw=2 et
