local utils = require "astronvim.utils"
return {
    {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "bash")
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "bashls")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed,
                                            {"shellcheck", "shfmt"})
            end
        }, {
            "jay-babu/mason-nvim-dap.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "bash")
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "cmake")
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "neocmake")
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, {
                            "cpp", "c", "objc", "cuda", "proto"
                        })
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "clangd")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed,
                                            "clang-format")
            end
        }, {
            "p00f/clangd_extensions.nvim",
            ft = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
            init = function()
                utils.list_insert_unique(astronvim.lsp.skip_setup, "clangd")
            end,
            opts = function()
                return {server = require("astronvim.utils.lsp").config "clangd"}
            end
        }, {
            "Civitasv/cmake-tools.nvim",
            ft = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
            dependencies = {
                {
                    "jay-babu/mason-nvim-dap.nvim",
                    opts = function(_, opts)
                        opts.ensure_installed =
                            utils.list_insert_unique(opts.ensure_installed,
                                                     "cpptools")
                    end
                }
            },
            opts = {}
        }
    }, {
        -- Golang support
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "go")
                end
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, {
                        "gomodifytags", "gofumpt", "iferr", "impl", "goimports"
                    })
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "gopls")
            end
        }, {
            "leoluz/nvim-dap-go",
            ft = "go",
            dependencies = {
                "mfussenegger/nvim-dap", {
                    "jay-babu/mason-nvim-dap.nvim",
                    opts = function(_, opts)
                        opts.ensure_installed =
                            utils.list_insert_unique(opts.ensure_installed,
                                                     "delve")
                    end
                }
            },
            opts = {}
        }, {
            "ray-x/go.nvim",
            dependencies = {
                "ray-x/guihua.lua", "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter"
            },
            opts = {},
            event = {"CmdlineEnter"},
            ft = {"go", "gomod"},
            build = ':lua require("go.install").update_all_sync()'
        }

    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed,
                                                 {"json", "jsonc"})
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "jsonls")
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed,
                                                 {"lua", "luap"})
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "lua_ls")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed,
                                            {"stylua", "luacheck"})
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, {
                            "markdown", "markdown_inline"
                        })
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "marksman")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "prettierd")
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed,
                                                 {"python", "toml"})
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed,
                                            {"pyright", "ruff_lsp"})
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "black")
            end
        }, {
            "jay-babu/mason-nvim-dap.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "python")
                if not opts.handlers then opts.handlers = {} end
                opts.handlers.python = function() end -- make sure python doesn't get set up by mason-nvim-dap, it's being set up by nvim-dap-python
            end
        }, {
            "linux-cultist/venv-selector.nvim",
            opts = {},
            keys = {
                {
                    "<leader>lv",
                    "<cmd>:VenvSelect<cr>",
                    desc = "Select VirtualEnv"
                }
            }
        }, {
            "mfussenegger/nvim-dap-python",
            dependencies = "mfussenegger/nvim-dap",
            ft = "python", -- NOTE: ft: lazy-load on filetype
            config = function(_, opts)
                local path =
                    require("mason-registry").get_package("debugpy"):get_install_path() ..
                        "/venv/bin/python"
                require("dap-python").setup(path, opts)
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "rust")
                end
            end
        }, {
            "simrat39/rust-tools.nvim",
            ft = {"rust"},
            init = function()
                astronvim.lsp.skip_setup =
                    utils.list_insert_unique(astronvim.lsp.skip_setup,
                                             "rust_analyzer")
            end,
            opts = function()
                local adapter
                local success, package = pcall(function()
                    return require("mason-registry").get_package "codelldb"
                end)
                if success then
                    local package_path = package:get_install_path()
                    local codelldb_path = package_path .. "/codelldb"
                    local liblldb_path = package_path ..
                                             "/extension/lldb/lib/liblldb"
                    local this_os = vim.loop.os_uname().sysname

                    -- The path in windows is different
                    if this_os:find "Windows" then
                        codelldb_path = package_path ..
                                            "\\extension\\adapter\\codelldb.exe"
                        liblldb_path = package_path ..
                                           "\\extension\\lldb\\bin\\liblldb.dll"
                    else
                        -- The liblldb extension is .so for linux and .dylib for macOS
                        liblldb_path = liblldb_path ..
                                           (this_os == "Linux" and ".so" or
                                               ".dylib")
                    end
                    adapter = require("rust-tools.dap").get_codelldb_adapter(
                                  codelldb_path, liblldb_path)
                else
                    adapter = require("rust-tools.dap").get_codelldb_adapter()
                end

                return {
                    server = require("astronvim.utils.lsp").config "rust_analyzer",
                    dap = {adapter = adapter}
                }
            end,
            dependencies = {
                {
                    "jay-babu/mason-nvim-dap.nvim",
                    opts = function(_, opts)
                        opts.ensure_installed =
                            utils.list_insert_unique(opts.ensure_installed,
                                                     "codelldb")
                    end
                }
            }
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed,
                                            "rust_analyzer")
            end
        }, {
            "Saecki/crates.nvim",
            init = function()
                vim.api.nvim_create_autocmd("BufRead", {
                    group = vim.api.nvim_create_augroup("CmpSourceCargo",
                                                        {clear = true}),
                    pattern = "Cargo.toml",
                    callback = function()
                        require("cmp").setup.buffer {
                            sources = {{name = "crates"}}
                        }
                        require "crates"
                    end
                })
            end,
            opts = {null_ls = {enabled = false, name = "crates.nvim"}}
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                -- Ensure that opts.ensure_installed exists and is a table or string "all".
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "toml")
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "taplo")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                -- Ensure that opts.handlers exists and is a table
                if not opts.handlers then opts.handlers = {} end
                opts.handlers.taplo = function() end
            end
        }
    }, {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "yaml")
                end
            end
        }, {
            "williamboman/mason-lspconfig.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "yamlls")
            end
        }, {
            "jay-babu/mason-null-ls.nvim",
            opts = function(_, opts)
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "prettierd")
            end
        }
    }
}
