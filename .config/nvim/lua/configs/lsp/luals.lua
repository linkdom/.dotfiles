local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.lua_ls.setup({

    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },

            diagnostics = {
                globals = { 'vim', 'use' },
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },

            telemetry = {
                enable = false,
            },
        },
    },

})

