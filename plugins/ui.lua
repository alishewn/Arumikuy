local status = require "astronvim.utils.status"
local get_icon = require("astronvim.utils").get_icon
return {
    {"Bekaboo/dropbar.nvim", event = "VeryLazy", opts = {}}, {
        'romgrk/barbar.nvim',
        event = "VeryLazy",
        dependencies = {
            'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons'
        },
        opts = {
            animation = true,
            -- auto_hide = true,
            tabpages = true,
            focus_on_close = 'left',
            insert_at_start = true,
            sidebar_filetypes = {
                ['neo-tree'] = {
                    event = 'BufWipeout',
                    text = '          File Explorer'
                }
            },
            no_name_title = nil
        }
    }, {
        "rebelot/heirline.nvim",
        event = "VeryLazy",
        optional = true,
        opts = {
            tabline = nil,
            winbar = nil,
            attributes = {mode = {bold = true}},
            icon_highlights = {file_icon = {statusline = false}},
            statusline = {
                hl = {fg = "fg", bg = "bg"},
                status.component.mode {
                    mode_text = {padding = {left = 1, right = 1}}
                },
                status.component.git_branch {
                    git_branch = {
                        icon = {
                            kind = "GitBranch",
                            padding = {left = 1, right = 1}
                        }
                    }
                },
                status.component.file_info {
                    filetype = false,
                    filename = {modify = ":."},
                    file_modified = false
                },
                status.component.git_diff(),
                status.component.diagnostics(),
                status.component.fill(),
                status.component.cmd_info(),
                status.component.fill(),
                status.component.lsp {{padding = {right = 1}}},
                status.component.treesitter(),
                status.component.nav {
                    ruler = {padding = {left = 0, right = 0}},
                    percentage = false,
                    scrollbar = false
                }
            }
        }
    }, {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     "
            }
            opts.config.opts.noautocmd = false
            local button = require("astronvim.utils").alpha_button
            opts.section.buttons.val = {
                button("LDR n  ", "  New File  "),
                button("LDR f p", "  Find Project  "),
                button("LDR f f", "  Find File  "),
                button("LDR f o", "󰈙  Recents  "),
                button("LDR f w", "󰈭  Find Word  "),
                button("LDR S f", "  Find Session  "),
                button("LDR f '", "  Bookmarks  "),
                button("LDR S l", "  Last Session  ")
            }
            return opts
        end
    }, {"tiagovla/scope.nvim", event = "VeryLazy", opts = {}}, {
        "rcarriga/nvim-notify",
        opts = {timeout = 1200, render = "compact", fps = 30, stages = "fade"}
    }, {
        "folke/noice.nvim",
        event = "VeryLazy",
        cond = not vim.g.neovide,
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
        opts = {
            lsp = {progress = {enabled = false}},
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false -- add a border to hover docs and signature help
            }
        },
        init = function() vim.g.lsp_handlers_enabled = false end
    }, {"ray-x/aurora", enabled = false}, {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            return require("astronvim.utils").extend_tbl(opts, {
                close_if_last_window = true,
                enable_diagnostics = true,
                sources = {"filesystem", "git_status"},
                window = {width = 35},
                source_selector = {
                    winbar = false,
                    sources = {
                        {
                            source = "filesystem",
                            display_name = get_icon("FolderClosed", 1, true) ..
                                "File"
                        }
                        -- { source = "git_status", display_name = get_icon("Git", 1, true) .. "Git" },
                    }
                },
                filesystem = {
                    bind_to_cwd = true,
                    filtered_items = {
                        always_show = {".github", ".gitignore", ".git"},
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {"node_modules", ".cache"},
                        never_show = {".DS_Store", "thumbs.db"}
                    }
                }
            })
        end
    }, {"folke/trouble.nvim", enabled = false},
    {"kylechui/nvim-surround", enabled = false},
    {"chentoast/marks.nvim", enabled = false},
    {"ThePrimeagen/harpoon", enabled = false}
}
