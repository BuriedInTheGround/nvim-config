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
        nix = { 'nixfmt' },
        typst = { 'typstyle' },
      },
      format_on_save = function(bufnr)
        local ignore_filetypes = { 'c', 'cpp', 'css', 'html', 'sql' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    },
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<Leader>n',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = '[N]eatly format current buffer',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
