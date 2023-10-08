require 'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  --project.nvim begin
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true

  },
  --project.nvim end
  -- auto_close = true,
  auto_reload_on_write = true,
  disable_netrw = true,
  -- hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    -- height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = true,
    signcolumn = "true",
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "",
      untracked = "",
      deleted = "",
      ignored = "",
    },
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  }
}
