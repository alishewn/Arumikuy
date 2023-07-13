local nproc = function()
  local procn = tonumber(vim.fn.system('nproc'))
  if procn == nil then
    return 4
  else
    return procn
  end
end

local utils = require "astronvim.utils"

return {
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
      server = {
        cmd = {
          "clangd",
          "--header-insertion=iwyu",
          "--clang-tidy",
          "-j=" .. nproc(),
          "--header-insertion-decorators",
          "--all-scopes-completion",
          "--pch-storage=memory",
          "--background-index",
          "--background-index-priority=low",
          "--clang-tidy",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--header-insertion=never",
          "--limit-references=200",
          "--limit-results=200",
          "--enable-config",
          "--log=verbose",
          "--offset-encoding=utf-8",
          "--pretty",
        },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "cpptools") end,
      },
    },
    opts = {},
  },
  {
    "ojroques/nvim-lspfuzzy",
    enabled = false,
  },
  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
  },
  {
    "ray-x/navigator.lua",
    enabled = false,
  },
  {
    "smjonas/inc-rename.nvim",
    enabled = false,
  },
  {
    "rmagatti/goto-preview",
    enabled = false,
  },
  {
    "SmiteshP/nvim-navbuddy",
    enabled = false,
  },
  {
    "stevearc/aerial.nvim",
    enabled = false,
  },
  {
    "DNLHC/glance.nvim",
    enabled = false,
  },
  {
    "ms-jpq/coq_nvim",
    enabled = false,
  },
}
