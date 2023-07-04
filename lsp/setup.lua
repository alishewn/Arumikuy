require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "jdtls",
    "hls",
    "clangd",
    "cmake",
    "pyright",
  },
})

local lspconfig = require('lspconfig')

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
  ["clangd"] = function()
    lspconfig.clangd.setup {
      cmd = {
        "/work/home18/fupeng/dev/.local/llvm-15/bin/clangd",
        "--compile_commands_dir=./.lsp",
        "--query-driver=/work/home18/fupeng/dev/.local/llvm-15/bin/clang-*",
        "--background-index",
        "--background-index-priority=low",
        "--clang-tidy",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--header-insertion=never",
        "--limit-references=200",
        "--limit-results=200",
        -- "--project-root=<string>",
        "--enable-config",
        "-j24",
        "--pch-storage=disk",
        "--log=error",
        "--offset-encoding=utf-8",
        "--pretty",
      }
    }
  end
})
