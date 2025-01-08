local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = false

lspconfig.intelephense.setup({
    capabilities = capabilities,
    init_options = {
        licenceKey = os.getenv("INTELEPHENSE_LICENSE"),
    },
    settings = {
        intelephense = {
            diagnostics = {
                enable = true,
            },
            files = {
                maxSize = 4999999,
            },
            environment = {
                phpVersion = "8.3"
            }
       }
   }
})

