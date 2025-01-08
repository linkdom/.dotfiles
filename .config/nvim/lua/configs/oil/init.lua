require('oil').setup({
  restore_win_options = true,    -- Restore window options after closing oil
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,          -- Show hidden files by default
  },
  float = {
    padding = 2,
    max_width = 80,
    border = "rounded",
  },
  preview = {
    border = "rounded",
  }
})

