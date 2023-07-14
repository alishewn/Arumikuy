local utils = require "astronvim.utils"
local prefix = "<leader>a"
local maps = {n = {}}
local icon = vim.g.icons_enabled and "󰷉 " or ""
maps.n[prefix] = {desc = icon .. "Annotation"}
require("astronvim.utils").set_mappings(maps)

return {
    {
        {
            "Pocco81/auto-save.nvim",
            event = {"User AstroFile", "InsertEnter"},
            opts = {trigger_events = {"InsertLeave"}}
        }
    }, {{"LudoPinelli/comment-box.nvim", opts = {}}}, {
        {
            "gbprod/cutlass.nvim",
            event = {"User AstroFile"},
            opts = function(_, opts)
                if utils.is_available "leap.nvim" then
                    opts.exclude = utils.list_insert_unique(opts.exclude,
                                                            {"ns", "nS"})
                end
                if utils.is_available "hop.nvim" then
                    opts.exclude = utils.list_insert_unique(opts.exclude,
                                                            {"ns", "nS"})
                end
            end
        }
    }, {
        {
            "tomiis4/Hypersonic.nvim",
            event = "CmdlineEnter",
            cmd = "Hypersonic",
            opts = {}
        }
    }, {
        {
            "danymat/neogen",
            cmd = "Neogen",
            opts = {
                snippet_engine = "luasnip",
                languages = {
                    lua = {template = {annotation_convention = "ldoc"}},
                    typescript = {template = {annotation_convention = "tsdoc"}},
                    typescriptreact = {
                        template = {annotation_convention = "tsdoc"}
                    }
                }
            },
            keys = {
                {
                    prefix .. "<cr>",
                    function()
                        require("neogen").generate {type = "current"}
                    end,
                    desc = "Current"
                }, {
                    prefix .. "c",
                    function()
                        require("neogen").generate {type = "class"}
                    end,
                    desc = "Class"
                }, {
                    prefix .. "f",
                    function()
                        require("neogen").generate {type = "func"}
                    end,
                    desc = "Function"
                }, {
                    prefix .. "t",
                    function()
                        require("neogen").generate {type = "type"}
                    end,
                    desc = "Type"
                }, {
                    prefix .. "F",
                    function()
                        require("neogen").generate {type = "file"}
                    end,
                    desc = "File"
                }
            }
        }
    }, {
        {
            "HiPhish/rainbow-delimiters.nvim",
            dependencies = "nvim-treesitter/nvim-treesitter",
            event = "User AstroFile",
            config = function(_, opts)
                require "rainbow-delimiters.setup"(opts)
            end
        }
    }, {
        {
            "ThePrimeagen/refactoring.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"
            },
            opts = {},
            keys = {
                {
                    "<leader>re",
                    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                    {silent = true, expr = false},
                    mode = {"v"},
                    desc = "Extract Function"
                }, {
                    "<leader>rf",
                    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
                    {silent = true, expr = false},
                    mode = {"v"},
                    desc = "Extract Function To File"
                }, {
                    "<leader>rv",
                    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                    {silent = true, expr = false},
                    mode = {"v"},
                    desc = "Extract Variable"
                }, {
                    "<leader>ri",
                    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                    {silent = true, expr = false},
                    mode = {"v"},
                    desc = "Inline Variable"
                }, {
                    "<leader>rb",
                    function()
                        require("refactoring").refactor "Extract Block"
                    end,
                    {silent = true, expr = false},
                    mode = {"n"},
                    desc = "Extract Block"
                }, {
                    "<leader>rbf",
                    function()
                        require("refactoring").refactor "Extract Block To File"
                    end,
                    {silent = true, expr = false},
                    mode = {"n"},
                    desc = "Extract Block To File"
                }, {
                    "<leader>ri",
                    function()
                        require("refactoring").refactor "Inline Variable"
                    end,
                    {silent = true, expr = false},
                    mode = {"n"},
                    desc = "Inline Variable"
                }, {
                    "<leader>rr",
                    function()
                        require("refactoring").select_refactor()
                    end,
                    {silent = true, expr = false},
                    desc = "Select Refactor"
                }, {
                    "<leader>rp",
                    function()
                        require("refactoring").debug.printf {below = false}
                    end,
                    mode = {"n"},
                    desc = "Debug: Print Function"
                }, {
                    "<leader>rv",
                    function()
                        require("refactoring").debug.print_var {
                            normal = true,
                            below = false
                        }
                    end,
                    mode = {"n"},
                    desc = "Debug: Print Variable"
                }, {
                    "<leader>rv",
                    function()
                        require("refactoring").debug.print_var {below = false}
                    end,
                    mode = {"v"},
                    desc = "Debug: Print Variable"
                }, {
                    "<leader>rc",
                    function()
                        require("refactoring").debug.cleanup {}
                    end,
                    mode = {"n"},
                    desc = "Debug: Clean Up"
                }
            }
        }
    }, {{"johmsalas/text-case.nvim", event = "User AstroFile", opts = {}}},
    {{"folke/todo-comments.nvim", opts = {}, event = "User AstroFile"}}, {
        {
            {"windwp/nvim-autopairs", enabled = false}, {
                "altermo/ultimate-autopair.nvim",
                event = "InsertEnter",
                opts = {
                    -- disable autopair in the command line: https://github.com/altermo/ultimate-autopair.nvim/issues/8
                    cmap = false,
                    extensions = {
                        rules = {
                            rules = {
                                {
                                    "call", function(o)
                                        -- disable in comments including markdown style
                                        local status, node = pcall(
                                                                 vim.treesitter
                                                                     .get_node,
                                                                 {
                                                pos = {o.linenr - 1, o.col - 2}
                                            })
                                        return
                                            o.incmd or o.col == 1 or not status or
                                                not node or node:type() ~=
                                                "comment" and node:type() ~=
                                                "html_block"
                                    end
                                }
                            }
                        },
                        -- get fly mode working on strings: https://github.com/altermo/ultimate-autopair.nvim/issues/33
                        fly = {nofilter = true}
                    },
                    config_internal_pairs = {
                        {'"', '"', fly = true}, {"'", "'", fly = true}
                    }
                },
                keys = {
                    {
                        "<leader>ua",
                        function()
                            local notify = require("astronvim.utils").notify
                            local function bool2str(bool)
                                return bool and "on" or "off"
                            end
                            local ok, ultimate_autopair = pcall(require,
                                                                "ultimate-autopair")
                            if ok then
                                ultimate_autopair.toggle()
                                vim.g.ultimate_autopair_enabled = require(
                                                                      "ultimate-autopair.core").disable
                                notify(string.format("ultimate-autopair %s",
                                                     bool2str(
                                                         not vim.g
                                                             .ultimate_autopair_enabled)))
                            else
                                notify "ultimate-autopair not available"
                            end
                        end,
                        desc = "Toggle ultimate-autopair"
                    }
                }
            }
        }
    }, {{"matze/vim-move", event = "BufEnter"}}
}
