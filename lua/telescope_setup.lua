-- [[ Configure Telescope ]]
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<Esc>'] = require('telescope.actions').close,
      },
    },
  },
})

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>tb', builtin.builtin, { desc = 'List [T]elescope [B]uiltins' })
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<Leader>wd', builtin.diagnostics, { desc = 'List [W]orkspace [D]iagnostics' })
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<Leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<Leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<Leader>fo', builtin.oldfiles, { desc = '[F]ind [R]ecent files' })
vim.keymap.set('n', '<Leader>f.', builtin.resume, { desc = 'Resume previous [F]ind' })

-- Search Neovim configuration files
vim.keymap.set('n', '<Leader>fn', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = '[F]ind [N]eovim files' })

-- vim: ts=2 sts=2 sw=2 et
