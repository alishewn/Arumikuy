local nproc = function()
  local procn = tonumber(vim.fn.system('nproc'))
  if procn == nil then
    return 4
  else
    return procn
  end
end

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
          -- "--query-driver=/work/home18/fupeng/dev/rugrats/output/gcc/bin/riscv32-rivai-elf-g*",
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
}
