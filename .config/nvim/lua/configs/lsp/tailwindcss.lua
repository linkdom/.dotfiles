local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

lspconfig.tailwindcss.setup({
    settings = {
        tailwindCSS = {
            -- Enable linting
            validate = true,

            -- Linting for class names
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },

            -- Emmet-like suggestions for Tailwind CSS
            emmetCompletions = true,

        },
    },

    filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "php",
        "astro",
        "blade",
    },

    root_dir = lspconfig.util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.ts",
        "package.json",
        ".git"
    ),

    on_attach = function(client, bufnr)
        -- Key mappings for LSP features (optional)
        -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<leader>gi", vim.diagnostic.open_float, {buffer=0})
        vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>do", vim.lsp.buf.code_action, {buffer=0})

        -- Additional client configuration
        client.server_capabilities.documentFormattingProvider = true
    end,
})

