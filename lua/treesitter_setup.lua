-- [[ Configure Treesitter ]]
-- Prefer git to curl for install grammars
require('nvim-treesitter.install').prefer_git = true
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'cpp',
    'css',
    'diff',
    'gitcommit',
    'go',
    'gomod',
    'gosum',
    'gowork',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'just',
    'latex',
    'lua',
    'luadoc',
    'luap',
    'make',
    'markdown',
    'markdown_inline',
    'nix',
    'python',
    'query',
    'rust',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
  playground = { enable = true },
})

-- vim: ts=2 sts=2 sw=2 et
