return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package Manager
    use 'mhartington/oceanic-next' -- Theme
    use "nvim-treesitter/nvim-treesitter" -- Syntax highlighting and parsing based on Tree-sitter
    use "nvim-treesitter/nvim-treesitter-context" -- Show code context at the top of the screen while scrolling
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- Syntax-aware text objects for Treesitter
    use 'nvim-tree/nvim-web-devicons' -- File icons
    use 'onsails/lspkind.nvim'       -- LSP completion icons

    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder and file picker
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use "jose-elias-alvarez/null-ls.nvim" -- LSP diagnostics and formatting via external tools

    use {
        "williamboman/mason.nvim", -- Package manager for LSPs, DAPs, linters, and formatters
        "jay-babu/mason-null-ls.nvim", -- Mason integration with null-ls
        "williamboman/mason-lspconfig.nvim", -- Mason integration with lspconfig
        "jayp0521/mason-nvim-dap.nvim", -- Mason integration with DAP (debugging)

        -- DAP (Debug Adapter Protocol)
        "nvim-neotest/nvim-nio", -- Async event loop helper for DAP
        "mfussenegger/nvim-dap", -- Core DAP implementation for Neovim
        "rcarriga/nvim-dap-ui", -- UI for DAP
        "theHamsta/nvim-dap-virtual-text", -- Virtual text display for DAP
        "nvim-telescope/telescope-dap.nvim", -- Telescope integration for DAP
    }

    -- LSP and Completion
    use 'neovim/nvim-lspconfig' -- Quick configuration for LSP servers
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer completion source for nvim-cmp
    use 'hrsh7th/cmp-path' -- Path completion source for nvim-cmp
    use 'hrsh7th/cmp-cmdline' -- Command line completion source for nvim-cmp
    use 'hrsh7th/nvim-cmp' -- Autocompletion engine

    use {
        'L3MON4D3/LuaSnip',  -- Snippet engine
        run = "make install_jsregexp",
        requires = { 'rafamadriz/friendly-snippets' } -- Default Snippets
    }

    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip integration for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Display function signatures during completion

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim', -- Statusline plugin
        requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- File icons for statusline
    }

    -- Project Navigation
    use {
        "ThePrimeagen/harpoon", -- Quick file switching and bookmarking
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'stevearc/oil.nvim' -- File explorer with editing capabilities

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim", -- Live markdown preview
        run = function() vim.fn["mkdp#util#install"]() end, -- Install dependencies after plugin installation
    })

    -- Vim Enhancements
    use 'tpope/vim-commentary' -- Commenting utility
    use 'tpope/vim-surround' -- Manage surrounding characters (quotes, brackets, etc.)
    use 'tpope/vim-unimpaired' -- Adds handy bracket mappings for quick navigation
    use 'tpope/vim-repeat' -- Enhances '.' (repeat) command
    use 'tpope/vim-fugitive' -- Git integration
    use 'christoomey/vim-tmux-navigator' -- Seamless navigation between Vim and Tmux
    use 'farmergreg/vim-lastplace' -- Restore cursor position when reopening files

    -- XML/HTML Text Objects
    use{
        'whatyouhide/vim-textobj-xmlattr', -- Text objects for XML/HTML attributes
        requires = 'kana/vim-textobj-user', -- Framework for custom text objects
    }

    -- Auto Pairs
    use{
        'windwp/nvim-autopairs', -- Auto-close pairs (brackets, quotes, etc.)
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- Split/Join Lines
    use {
        'AndrewRadev/splitjoin.vim', -- Easily switch between single-line and multi-line code
        config = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end
    }

    -- Paste Enhancement
    use{
        'sickill/vim-pasta', -- Properly adjust indentation when pasting
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end
    }

    -- Undo History
    use 'mbbill/undotree' -- Visualize and manage undo history
    use 'vimwiki/vimwiki' -- Personal wiki for Vim

    -- Laravel Development (still experimental and not fully implemented, the plugin dev messed some things up and i have no time to debug)
    use {
      'adalessa/laravel.nvim', -- Laravel development tools
      tag = 'v2.2.1',
      requires = {
        'tpope/vim-dotenv', -- Manage environment variables for Laravel
        'MunifTanjim/nui.nvim', -- UI components for Neovim
        'kevinhwang91/promise-async', -- Async utilities
        'nvim-telescope/telescope.nvim',
      },
    }
end)
