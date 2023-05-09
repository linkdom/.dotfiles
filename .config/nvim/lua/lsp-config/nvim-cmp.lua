-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'bashls', 'cssls', 'cssmodules_ls', 'denols', 'dockerls', 'ember', 'eslint', 'golangci_lint_ls', 'gopls', 'html', 'intelephense', 'marksman', 'phpactor', 'psalm', 'pyright', 'quick_lint_js', 'rome', 'stylelint_lsp', 'tailwindcss', 'sumneko_lua','tsserver' }
lspconfig.bashls.setup{capabilities = capabilities}
lspconfig.clangd.setup{capabilities = capabilities}
lspconfig.cssls.setup{capabilities = capabilities}
lspconfig.diagnosticls.setup{capabilities = capabilities}
lspconfig.dockerls.setup{capabilities = capabilities}
lspconfig.dotls.setup{capabilities = capabilities}
lspconfig.emmet_ls.setup{capabilities = capabilities}
lspconfig.html.setup{capabilities = capabilities}
lspconfig.jsonls.setup{capabilities = capabilities}
lspconfig.quick_lint_js.setup{capabilities = capabilities}
lspconfig.lua_ls.setup{capabilities = capabilities}
lspconfig.marksman.setup{capabilities = capabilities}
lspconfig.intelephense.setup{capabilities = capabilities}
lspconfig.phpactor.setup{capabilities = capabilities}
lspconfig.pyright.setup{capabilities = capabilities}
lspconfig.sqlls.setup{capabilities = capabilities}
lspconfig.CSS.setup{capabilities = capabilities}
lspconfig.tailwindcss.setup{capabilities = capabilities}
lspconfig.tsserver.setup{capabilities = capabilities}
lspconfig.lemminx.setup{capabilities = capabilities}
lspconfig.yamlls.setup{capabilities = capabilities}

-- for _, lsp in ipairs(servers) do
  -- lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    -- ,
  -- }
-- end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
