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
            capabilities = {offsetEncoding = "utf-8"},
            server = {
                cmd = {
                    "clangd", "--header-insertion=iwyu", "--clang-tidy",
                    "-j=" .. nproc(), "--header-insertion-decorators",
                    "--all-scopes-completion", "--pch-storage=memory",
                    "--background-index", "--background-index-priority=low",
                    "--clang-tidy", "--completion-style=detailed",
                    "--function-arg-placeholders", "--header-insertion=never",
                    "--limit-references=200", "--limit-results=200",
                    "--enable-config", "--log=verbose",
                    "--offset-encoding=utf-8", "--pretty"
                }
            },
            extensions = {autoSetHints = false}
        }
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
    }, {
        "smjonas/inc-rename.nvim",
        opts = {},
        keys = {
            {
                "<leader>lr",
                function()
                    require "inc_rename"
                    return ":IncRename " .. vim.fn.expand "<cword>"
                end,
                expr = true,
                desc = "IncRename"
            }
        }
    }, {
        "lvimuser/lsp-inlayhints.nvim",
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
                callback = function(args)
                    if not (args.data and args.data.client_id) then
                        return
                    end
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.server_capabilities.inlayHintProvider then
                        local inlayhints = require "lsp-inlayhints"
                        inlayhints.on_attach(client, args.buf)
                        require("astronvim.utils").set_mappings({
                            n = {
                                ["<leader>uH"] = {
                                    inlayhints.toggle,
                                    desc = "Toggle inlay hints"
                                }
                            }
                        }, {buffer = args.buf})
                    end
                end
            })
        end,
        opts = {}
    }, {
        "simrat39/rust-tools.nvim",
        optional = true,
        opts = {tools = {inlay_hints = {auto = false}}}
    }, {
        "onsails/lspkind.nvim",
        opts = {
            mode = 'symbol_text',
            preset = 'codicons',
            symbol_map = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = ""
            }
        }
    }, {"ray-x/lsp_signature.nvim", opts = {}},
    {"rmagatti/goto-preview", opts = {}},
    {"simrat39/symbols-outline.nvim", opts = {}},
    {"kosayoda/nvim-lightbulb", opts = {}}, {
        "SmiteshP/nvim-navbuddy",
        dependencies = {"SmiteshP/nvim-navic", "MunifTanjim/nui.nvim"},
        opts = {lsp = {auto_attach = true}}
    }, {
        "ldelossa/litee.nvim",
        opts = {
            tree = {icon_set = "codicons"},
            panel = {orientation = "right", panel_size = 30}
        }
    }, {"DNLHC/glance.nvim", opts = {}},
    {"m-demare/hlargs.nvim", opts = {}, event = "User AstroFile"},
    {"stevearc/aerial.nvim", opts = {}}
}
