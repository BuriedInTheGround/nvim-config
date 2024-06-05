-- Enable line number
vim.o.number = true

-- Enable mouse support in Normal and Visual modes
vim.o.mouse = 'nv'

-- Mode is already shown in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
vim.o.clipboard = 'unnamedplus'

-- Use for 4 spaces for indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Configure visual line wrapping
vim.o.breakindent = true
vim.o.wrap = true

-- Enable undo history
vim.o.undofile = true

-- Case-insensitive searching unless \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Show some control characters
vim.o.list = true
vim.o.listchars = 'tab:⇥ ,trail:·,nbsp:⍽'

-- Highlight current line and column 80
vim.o.cursorline = true
vim.o.colorcolumn = '80'

-- Leave some space above and below the cursor
vim.o.scrolloff = 8

-- Reduce update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,preview'

-- Enable 24-bit RGB color
vim.o.termguicolors = true

-- [[ Hybrid line number ]]
local number_group = vim.api.nvim_create_augroup('HybridNumber', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  callback = function()
    if not vim.o.relativenumber then -- avoid first redraw
      vim.o.relativenumber = true
    end
  end,
  group = number_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  callback = function()
    vim.o.relativenumber = false
  end,
  group = number_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
