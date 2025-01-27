local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- local opts = { noremap=true, silent=true }


lspconfig.stimulus_ls.setup({
  capabilities = capabilities,
  cmd = { "stimulus-language-server", "--stdio" }, -- Command to start the LSP
  filetypes = { "html", "blade", "javascript", "typescript", "vue" },  -- Filetypes to attach the LSP to
  root_dir = lspconfig.util.root_pattern("package.json", ".git", "stimulus.js", "controllers"), -- Project root detection
  settings = {
    stimulus = {
      enable = true,  -- Enable the language server
      linting = true, -- Enable linting for Stimulus controllers
      diagnostics = true, -- Enable diagnostics
    }
  }
})
