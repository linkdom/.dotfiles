local null_ls = require("null-ls")

require("mason").setup()
-- require("mason-lspconfig").setup()


require("mason-null-ls").setup({ automatic_setup = true })
require("mason-nvim-dap").setup()

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.ltrs,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.diagnostics.php,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.formatting.phpcbf,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustfmt,
    },
})

-- local sources = {
--     null_ls.builtins.code_actions.refactoring,
--     null_ls.builtins.completion.luasnip,
--     null_ls.builtins.diagnostics.php,
--     null_ls.builtins.diagnostics.phpcs,
--     null_ls.builtins.diagnostics.yamllint,
--     null_ls.builtins.diagnostics.dotenv_linter,
--     null_ls.builtins.formatting.phpcbf,
--     null_ls.builtins.formatting.phpcsfixer,
--     null_ls.builtins.formatting.stylua,
-- }
-- sources.method = null_ls.methods.CODE_ACTION

-- null_ls.register({ sources })
