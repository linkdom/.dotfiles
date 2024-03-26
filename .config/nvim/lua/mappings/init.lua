local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('i', '<leader><alt>', '<esc>', opts)

-- Default
map('n', '<leader>h', ':wincmd h<CR>', opts)
map('n', '<leader>j', ':wincmd j<CR>', opts)
map('n', '<leader>k', ':wincmd k<CR>', opts)
map('n', '<leader>l', ':wincmd l<CR>', opts)
map('n', '<leader>tt', ':tab split<CR>', opts)

-- Telescope
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fe', ':Telescope diagnostics<CR>', opts)
map('n', '<leader>fc', ':Telescope git_commits<CR>', opts)
map('n', '<leader>fr', ':lua require("telescope.builtin").lsp_references() <CR>', opts)

-- Harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file() <CR>', opts)
map('n', '<leader><leader>', ':lua require("harpoon.ui").toggle_quick_menu() <CR>', opts)
map('n', '<leader>a', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<leader>s', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<leader>f', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<leader>v', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- Markdown Preview
map('n', '<leader>mp', ':MarkdownPreview<CR>', opts)

-- Git
map('n', '<leader>gb', ':BlamerToggle<CR>', opts)
map('n', '<leader>gs', ':Git<CR>', opts)
map('n', '<leader>ga', ':Git add .<CR>', opts)
map('n', '<leader>gp', ':Git push<CR>', opts)
map('n', '<leader>gc', ':Gvdiffsplit!<CR>', opts)
map('n', '<leader>gl', ':Git log<CR>', opts)
map('n', '<leader>gg', ':diffget //2<CR>', opts)
map('n', '<leader>gh', ':diffget //3<CR>', opts)

--DAP
map('n', '<leader>b', [[:lua require"dap".toggle_breakpoint()<CR>]], opts)
map('n', '<leader>sd', [[:lua require"dap".continue()<CR>]], opts)
map('n', '<leader>n', [[:lua require"dap".step_over()<CR>]], opts)
map('n', '<leader>si', [[:lua require"dap".step_into()<CR>]], opts)
map('n', '<leader>so', [[:lua require"dap".step_out()<CR>]], opts)
map('n', '<leader>sh', [[:lua require"dap.ui.widgets".hover()<CR>]], opts)
map('n', '<leader>z', ':lua require("dapui").toggle()<CR>', opts)

-- UndoTree
vim.keymap.set('n', '<leader>ut', ':UndotreeToggle<CR>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('n', ';;', '<Esc>A;<Esc>')
vim.keymap.set('n', ',,', '<Esc>A,<Esc>')

-- Disable annoying command line thing
vim.keymap.set('n', 'q:', ':q<CR>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')


vim.keymap.set('n', '<leader>i', '<C-]>')
vim.keymap.set('n', '<leader>o', '<C-t>')
