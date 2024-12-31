return {
  -- Startup time profiling
  {
    'dstein64/vim-startuptime',
    init = function()
      vim.g.startuptime_tries = 10
    end,
    cmd = 'StartupTime',
  },

  {
    'pcolladosoto/tinygo.nvim',
    config = true,
    cmd = { 'TinyGoEnv', 'TinyGoSetTarget', 'TinyGoTargets' },
  },

  -- Generate an image of the current buffer contents using Charm Freeze
  {
    'charm-community/freeze.nvim',
    config = function()
      require('freeze').setup({
        command = 'freeze',
        output = function()
          return './' .. os.date('%Y-%m-%dT%T%z') .. '_freeze.png'
        end,
        theme = 'charm',
      })
    end,
    cmd = 'Freeze',
  },
}

-- vim: ts=2 sts=2 sw=2 et
