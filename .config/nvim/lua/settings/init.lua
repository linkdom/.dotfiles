local set = vim.opt

vim.cmd("syntax enable")

set.termguicolors = true
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.autoindent = true
set.nu = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 15
set.sidescrolloff = 15
set.termguicolors = true

set.relativenumber = true
set.cursorline = true
set.hidden = true

--uncomment this if i want folding capability - fold with zc and unfold with zo
--set.foldmethod = "expr"
--set.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.vimwiki_list = {
    {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md'
    }
}

-- Round the hover border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded"
  }
)

-- Allows to have undoing across saves and for yanked items to be put into the copy reg
vim.cmd([[
    set history=100
    set undolevels=1000
    set undofile
    set clipboard=unnamedplus
    highlight NormalFloat guibg=NONE
    highlight FloatBorder guibg=NONE guifg=#555555
]])
