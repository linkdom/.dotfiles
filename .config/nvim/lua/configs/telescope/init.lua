local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { width_padding = 0.1, height_padding = 0.1, preview_width = 0.55 },
      vertical = { width_padding = 0.05, height_padding = 1, preview_height = 0.5 },
      prompt_position = "top",
    },
    file_ignore_patterns = { "node_modules", ".git/", "target", "build" },
    path_display = { "truncate" },
    winblend = 10,
    border = true,
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
      n = {
        ["q"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                     -- false will only do exact matching
      override_generic_sorter = true,   -- override the generic sorter
      override_file_sorter = true,      -- override the file sorter
      case_mode = "smart_case",         -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      hijack_netrw = true,
    },
  }
})

telescope.load_extension('fzf')
