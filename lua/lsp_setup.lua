-- [[ Configure LSP ]]
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Go to <thing>
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<Leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Show symbols
    map('<Leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Show documentation
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Actions
    map('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Workspace folders management
    map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    map('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Toggle inlay hints
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true) -- Turn on by default
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, '[T]oggle Inlay [H]ints')
    end

    -- Command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local spell_check_filetypes = {
  'c',
  'cpp',
  'go',
  'javascript',
  'lua',
  'python',
  'rust',
  'typescript',
  -- 'typst', -- TODO: enable when support is available, too many hits for now
}

-- Enable the following language servers
local servers = {
  ['asm_lsp'] = {},
  ['bashls'] = {},
  ['clangd'] = {},
  ['cssls'] = {
    settings = {
      css = {
        lint = { unknownAtRules = 'ignore' },
      },
    },
  },
  ['eslint'] = {},
  ['gopls'] = {
    settings = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        unusedvariable = true,
      },
      staticcheck = true,
    },
  },
  ['html'] = {},
  ['jsonls'] = {},
  ['lua_ls'] = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
        telemetry = { enable = false },
        workspace = { checkThirdParty = false },
      },
    },
  },
  ['ltex'] = {
    filetypes = vim.list_extend({
      'bib',
      'gitcommit',
      'markdown',
      'org',
      'plaintex',
      'rst',
      'rnoweb',
      'tex',
      'pandoc',
      'quarto',
      'rmd',
      'context',
      -- 'html', -- TODO: enable when support is less basic
      -- 'xhtml', -- TODO: enable when support is less basic
    }, spell_check_filetypes),
    settings = {
      ltex = {
        enabled = vim.list_extend({
          'bibtex',
          'gitcommit',
          'markdown',
          'org',
          'tex',
          'restructuredtext',
          'rsweave',
          'latex',
          'quarto',
          'rmd',
          'context',
          -- 'html', -- TODO: enable when support is less basic
          -- 'xhtml', -- TODO: enable when support is less basic
        }, spell_check_filetypes),
        dictionary = {
          -- stylua: ignore
          ['en-US'] = {
            'TODO', 'WIP', -- todo-type comments
            'NOTE', 'XXX', 'INFO', 'DOCS', 'PERF', 'TEST', -- note-type comments
            'HACK', 'WARNING', 'WARN', 'FIX', -- warning-type comments
            'FIXME', 'BUG', 'ERROR', 'DEPRECATED', -- error-type comments
          },
        },
      },
    },
  },
  ['marksman'] = {},
  ['nil_ls'] = {
    settings = {
      ['nil'] = {
        nix = { flake = { autoArchive = false } },
      },
    },
  },
  ['pylsp'] = {},
  ['tailwindcss'] = {},
  ['typst_lsp'] = {},
  ['yamlls'] = {},
}

require('mason').setup({ PATH = 'append' })
require('mason-lspconfig').setup()

-- Set up all of the above servers
for server_name, server in pairs(servers) do
  -- This handles overriding only values explicitly passed by the server
  -- configuration above. Useful when disabling certain features of an LSP.
  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  require('lspconfig')[server_name].setup(server)
end

-- vim: ts=2 sts=2 sw=2 et
