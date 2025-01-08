local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local opts = { noremap=true, silent=true }


lspconfig.html.setup({
    filetypes = { "html", "blade" },
    settings = {
        html = {
            format = {
                enable = true,
                wrapLineLength = 120,
                unformatted = "pre,code,textarea",
            },
            hover = {
                documentation = true,
                references = true,
            },
            suggest = {
                html5 = true,
            },
        },
        css = {
            lint = {
                validProperties = { "custom-property" },
            },
        },
        javascript = {
            format = {
                semicolons = "insert",
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Keymaps for LSP features
        -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<leader>gi", vim.diagnostic.open_float, {buffer=0})
        vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>do", vim.lsp.buf.code_action, {buffer=0})

        -- Formatting
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>yf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
        end
    end,
})
