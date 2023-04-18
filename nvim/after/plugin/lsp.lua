local lsp_zero = require("lsp-zero")
local mason = require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp.SelectBehavior.Select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp.SelectBehavior.Select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  completion = {
    completeopt = 'menu,menuone,noinsert',
    keyword_length = 1,
    max_item_count = 15,
  },
})
 -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_config = {
  clangd = { capabilities = capabilities },
  eslint = { capabilities = capabilities },
  jsonls = { capabilities = capabilities },
  lua_ls = { capabilities = capabilities },
  tsserver = { capabilities = capabilities },
  pyright = { capabilities = capabilities },
  html = { capabilities = capabilities },
  cmake = { capabilities = capabilities },
  cssmodules_ls = { capabilities = capabilities },
}

local preferences = {
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  },
  on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,
}

lsp_zero.setup(lsp_config, preferences)

