local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('i', '<leader><alt>', '<esc>', opts)

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- Commenting
map('n', 'gcap', '@c', opts)
map('n', 'guap', '@u', opts)
map('n', 'gcl', '@l', opts)
map('n', 'gul', '@z', opts)
map('n', '<leader>ca', '@d', opts)

-- Harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file() <CR>', opts)
map('n', '<leader><leader>', ':lua require("harpoon.ui").toggle_quick_menu() <CR>', opts)
map('n', '<leader>h', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<leader>j', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<leader>k', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<leader>l', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- Markdown Preview
map('n', '<leader>!', ':MarkdownPreview<CR>', opts)

--map('n', '<leader>k', ':wincmd k<CR>', opts)
--map('n', '<leader>j', ':wincmd j<CR>', opts)
--map('n', '<leader>h', ':wincmd h<CR>', opts)
--map('n', '<leader>l', ':wincmd l<CR>', opts)
