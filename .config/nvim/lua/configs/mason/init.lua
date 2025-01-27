local null_ls = require("null-ls")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        border = "rounded"
    }
})
require("mason-null-ls").setup({
    ensure_installed = { "lua_ls", "vue-language-server" },
    automatic_installation = true,
    automatic_setup = true,
})
require("mason-nvim-dap").setup()

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.formatting.blade_formatter,
    },
})
