return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } }, padding = { left = 0, right = 0 } }, -- add the mode text
      status.component.git_branch { git_branch = { icon = { kind = "GitBranch", padding = { left = 1, right = 1 } } }, padding = {
        left = 1, right = 1 } },
      status.component.file_info { padding = { left = 1, right = 1 }, filetype = false, filename = {
        modify = ":.",
      }, file_modified = false },
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp({ padding = { right = 1 } }),
      status.component.treesitter(),
      status.component.nav({ ruler = { padding = { left = 0, right = 1 } }, percentage = false, scrollbar = false }),
    }
    return opts
  end,
}
