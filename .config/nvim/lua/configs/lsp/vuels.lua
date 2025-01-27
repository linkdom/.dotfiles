local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.vuels.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/vue-language-server", "--stdio" },
    capabilities = capabilities,
    filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    init_options = {
        typescript = {
             tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
        },
    },
    settings = {
        volar = {
            useWorkspaceDependencies = true,
            validation = {
                template = true,
                script = true,
                style = true,
            },
        },
    },
})
