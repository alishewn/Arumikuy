local get_icon = require("astronvim.utils").get_icon

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      close_if_last_window = true,
      enable_diagnostics = true,
      sources = {
        "filesystem",
      },
      window = {
        width = 35,
      },
      source_selector = {
        winbar = false,
        sources = {
          { source = "filesystem", display_name = get_icon("FolderClosed", 1, true) .. "File" },
        },
      },
      filesystem = {
        filtered_items = {
          always_show = { ".github", ".gitignore", ".git" },
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    })
  end,
}
