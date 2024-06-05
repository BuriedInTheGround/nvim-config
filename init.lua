-- [[ Set <Space> as the leader key ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Set options ]]
require('options')

-- [[ Set basic keymaps ]]
require('keymaps')

-- [[ Install `lazy.nvim` as the plugin manager ]]
require('lazy_bootstrap')

-- [[ Configure plugins ]]
require('lazy_plugins')

-- [[ Configure Telescope ]]
-- Lazy loaded from lua/plugins/editor.lua

-- [[ Configure LSP ]]
-- Lazy loaded from lua/plugins/lsp.lua

-- [[ Configure autocompletion ]]
-- Lazy loaded from lua/plugins/cmp.lua

-- [[ Configure Treesitter ]]
-- Lazy loaded from lua/plugins/treesitter.lua

-- vim: ts=2 sts=2 sw=2 et
