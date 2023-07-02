local plugins = {
  "AstroNvim/astrocommunity",
  ---------------------------------------------------------------------
  -- bars-and-lines
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  -- { import = "astrocommunity.bars-and-lines.statuscol-nvim" }, -- ?
  { import = "astrocommunity.bars-and-lines.scope-nvim" },

  ---------------------------------------------------------------------
  -- color
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.color.vim-highlighter" },

  ---------------------------------------------------------------------
  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
      nvimtree = true,
      no_italic = true,
    },
  },

  ---------------------------------------------------------------------
  -- completion
  -- { import = "astrocommunity.completion.codeium-vim" },

  ---------------------------------------------------------------------
  --debugging
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  ---------------------------------------------------------------------
  --diagnostics
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

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
  -- { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },

  ---------------------------------------------------------------------
  -- motion
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.vim-matchup" },

  ---------------------------------------------------------------------
  -- pack
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.cpp" },
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
  -- { import = "astrocommunity.utility.noice-nvim" },
}

return plugins
