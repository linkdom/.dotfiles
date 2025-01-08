local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require('lspkind')

-- Use LSPkind for DevIcons
lspkind.init()

cmp.setup {
    formatting = {
        format = function(entry, vim_item)
            -- Use lspkind icons if available
            vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol' })

            -- Fix LSP source name (avoids duplicates)
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
            })[entry.source.name]

            return vim_item

        end
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)  -- Use LuaSnip for expanding snippets
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
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',
            entry_filter = function(entry, ctx)
                return entry:get_kind() ~= 15  -- Filter out snippet kind
            end,
        },    { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' }, -- Signature help source
        { name = 'buffer' },
        { name = 'path' },
    }),
}



-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'

-- local kind_icons = {
--   Text = "",
--   Method = "",
--   Function = "󰊕",
--   Constructor = "",
--   Field = "󰇽",
--   Variable = "󰂡",
--   Class = "󰙅",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "󰎠",
--   Enum = "",
--   Keyword = "󰌋",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "󰆓",
--   TypeParameter = "󰅲"
-- }

-- cmp.setup {
--   formatting = {
--     format = function(entry, vim_item)
--       -- Kind icons
--       vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--       -- Source
--       vim_item.menu = ({
--         buffer = "[Buffer]",
--         nvim_lsp = "[LSP]",
--         luasnip = "[LuaSnip]",
--         nvim_lua = "[Lua]",
--         latex_symbols = "[LaTeX]",
--       })[entry.source.name]
--       return vim_item
--     end
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   }),
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--     { name = 'nvim_lsp_signature_help'},
--   },
-- }
