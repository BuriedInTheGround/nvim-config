return {
  -- Adjust buffer options heuristically
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Smart commenting
  {
    'numToStr/Comment.nvim',
    config = true,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  {
    'kylechui/nvim-surround',
    config = true,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Automatic code formatting
  {
    'stevearc/conform.nvim',
    init = function()
      vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
    end,
    opts = {
      formatters_by_ft = {
        go = { 'goimports', 'gofmt' },
        lua = { 'stylua' },
      },
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
    },
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<Leader>n',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = '[N]eatly format current buffer',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
