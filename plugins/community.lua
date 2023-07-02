local plugins = {
  "AstroNvim/astrocommunity",
  ---------------------------------------------------------------------
  -- bars-and-lines
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  { import = "astrocommunity.bars-and-lines.scope-nvim" },

  ---------------------------------------------------------------------
  -- color
  { import = "astrocommunity.color.ccc-nvim" },
  -- { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.color.vim-highlighter" },
  ---------------------------------------------------------------------
  -- completion
  -- { import = "astrocommunity.completion.codeium-vim" },

  ---------------------------------------------------------------------
  --debugging
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  ---------------------------------------------------------------------
  --editing-support
  -- { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.true-zen-nvim" },

  ---------------------------------------------------------------------
  -- file-explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },

  ---------------------------------------------------------------------
  -- git
  -- { import = "astrocommunity.git.git-blame-nvim" },

  ---------------------------------------------------------------------
  -- lsp
  { import = "astrocommunity.lsp.inc-rename-nvim" },

  ---------------------------------------------------------------------
  -- motion
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.vim-matchup" },

  ---------------------------------------------------------------------
  -- pack
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.project.project-nvim" },

  ---------------------------------------------------------------------
  -- scrolling
  { import = "astrocommunity.scrolling.neoscroll-nvim" },

  ---------------------------------------------------------------------
  -- syntax
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.syntax.vim-easy-align" },

  ---------------------------------------------------------------------
  -- utility
  { import = "astrocommunity.utility.noice-nvim" },
}

return plugins
