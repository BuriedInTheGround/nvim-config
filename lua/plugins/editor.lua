return {
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
        build = 'make',
      },
    },
    config = function()
      require('telescope_setup')
    end,
    branch = '0.1.x',
    event = 'VimEnter', -- could be loaded even more lazily by removing this
    cmd = 'Telescope',
    keys = {
      { '<Leader>tb', desc = 'List [T]elescope [B]uiltins' },
      { '<Leader>fb', desc = '[F]ind [B]uffers' },
      { '<Leader>wd', desc = 'List [W]orkspace [D]iagnostics' },
      { '<Leader>ff', desc = '[F]ind [F]iles' },
      { '<Leader>fw', desc = '[F]ind current [W]ord' },
      { '<Leader>fh', desc = '[F]ind [H]elp' },
      { '<Leader>fk', desc = '[F]ind [K]eymaps' },
      { '<Leader>fg', desc = '[F]ind by [G]rep' },
      { '<Leader>fr', desc = '[F]ind [R]ecent files' },
      { '<Leader>f.', desc = 'Resume previous [F]ind' },
      { '<Leader>fn', desc = '[F]ind [N]eovim files' },
    },
  },

  -- Edit the file system like a normal buffer (replaces netrw)
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open parent directory' })
    end,
  },

  -- Highlighting of all uses of the word under the cursor
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure()
    end,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Git decorations
  {
    'lewis6991/gitsigns.nvim',
    config = true,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Unique f/F/t/T indicators for each word on the line
  {
    'jinh0/eyeliner.nvim',
    opts = { highlight_on_key = true, dim = true },
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Left-pad the buffer to the middle of the screen
  {
    'shortcuts/no-neck-pain.nvim',
    lazy = false,
    opts = {
      width = 112,
      fallbackOnBufferDelete = true,
      autocmds = {
        enableOnVimEnter = false,
        reloadOnColorSchemeChange = true,
      },
      mappings = {
        enabled = true,
        toggle = '<Leader>z',
        scratchPad = '<Leader>s',
      },
      buffers = {
        setNames = true,
        wo = { fillchars = 'eob: ' },
        left = { scratchPad = { pathToFile = '~/notes.md' } },
      },
    },
    version = '*',
    cmd = { 'NoNeckPain', 'NoNeckPainScratchPad' },
    keys = {
      { '<Leader>z', desc = 'Toggle NoNeckPain' },
      { '<Leader>s', desc = 'Toggle [S]cratch pad' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
