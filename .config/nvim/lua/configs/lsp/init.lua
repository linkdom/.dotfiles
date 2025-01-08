local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = false

local servers = {
    "bashls",
    "clangd",
    "diagnosticls",
    "emmet_ls",
    "gopls",
    "ts_ls",
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<leader>gi", vim.diagnostic.open_float, {buffer=0})
        vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>do", vim.lsp.buf.code_action, {buffer=0})
    end
  }
end
