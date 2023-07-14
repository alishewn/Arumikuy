local utils = require "astronvim.utils"
local prefixa = "<leader>a"
local prefixz = "<leader>z"
local maps = {n = {}}
local icon = vim.g.icons_enabled and "󰷉 " or ""
maps.n[prefixa] = {desc = icon .. "Annotation"}
require("astronvim.utils").set_mappings(maps)
return {
    {
        "Pocco81/auto-save.nvim",
        event = {"User AstroFile", "InsertEnter"},
        opts = {}
    }, {"LudoPinelli/comment-box.nvim", opts = {}}, {
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
    }, {
        "monaqa/dial.nvim",
        keys = {
            {
                "<C-a>",
                mode = {"v"},
                function()
                    return require("dial.map").inc_visual()
                end,
                expr = true,
                desc = "Increment"
            }, {
                "<C-x>",
                mode = {"v"},
                function()
                    return require("dial.map").dec_visual()
                end,
                expr = true,
                desc = "Decrement"
            }, {
                "g<C-a>",
                mode = {"v"},
                function()
                    return require("dial.map").inc_gvisual()
                end,
                expr = true,
                desc = "Increment"
            }, {
                "g<C-x>",
                mode = {"v"},
                function()
                    return require("dial.map").dec_gvisual()
                end,
                expr = true,
                desc = "Decrement"
            }, {
                "<C-a>",
                function()
                    return require("dial.map").inc_normal()
                end,
                expr = true,
                desc = "Increment"
            }, {
                "<C-x>",
                function()
                    return require("dial.map").dec_normal()
                end,
                expr = true,
                desc = "Decrement"
            }
        },
        config = function()
            local augend = require "dial.augend"
            require("dial.config").augends:register_group{
                default = {
                    augend.integer.alias.decimal, augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"], augend.constant.alias.bool,
                    augend.semver.alias.semver, augend.case.new {
                        types = {
                            "camelCase", "PascalCase", "snake_case",
                            "SCREAMING_SNAKE_CASE"
                        }
                    }
                }
            }
        end
    }, {
        "tomiis4/Hypersonic.nvim",
        event = "CmdlineEnter",
        cmd = "Hypersonic",
        opts = {}
    }, {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {"smoka7/hydra.nvim"},
        opts = {},
        keys = {
            {
                "<Leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for word under the cursor"
            }
        }
    }, {
        "danymat/neogen",
        cmd = "Neogen",
        opts = {
            snippet_engine = "luasnip",
            languages = {
                lua = {template = {annotation_convention = "ldoc"}},
                typescript = {template = {annotation_convention = "tsdoc"}},
                typescriptreact = {template = {annotation_convention = "tsdoc"}}
            }
        },
        keys = {
            {
                prefixa .. "<cr>",
                function()
                    require("neogen").generate {type = "current"}
                end,
                desc = "Current"
            }, {
                prefixa .. "c",
                function()
                    require("neogen").generate {type = "class"}
                end,
                desc = "Class"
            }, {
                prefixa .. "f",
                function()
                    require("neogen").generate {type = "func"}
                end,
                desc = "Function"
            }, {
                prefixa .. "t",
                function()
                    require("neogen").generate {type = "type"}
                end,
                desc = "Type"
            }, {
                prefixa .. "F",
                function()
                    require("neogen").generate {type = "file"}
                end,
                desc = "File"
            }
        }
    }, {
        {
            "bennypowers/nvim-regexplainer",
            opts = {},
            ft = {
                "html", "javascript", "javascriptreact", "typescript",
                "typescriptreact"
            }
        }, -- Regex support
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                -- add regex to treesitters
                if opts.ensure_installed ~= "all" then
                    opts.ensure_installed =
                        utils.list_insert_unique(opts.ensure_installed, "regex")
                end
            end
        }
    }, {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "User AstroFile",
        config = function(_, opts)
            require "rainbow-delimiters.setup"(opts)
        end
    }, {
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
    }, {
        "nvim-telescope/telescope.nvim",
        dependencies = {"debugloop/telescope-undo.nvim"},
        keys = {{"<leader>fu", "<cmd>Telescope undo<CR>", desc = "Find undos"}},
        opts = function() require("telescope").load_extension "undo" end
    }, {"johmsalas/text-case.nvim", event = "User AstroFile", opts = {}},
    {{"folke/todo-comments.nvim", opts = {}, event = "User AstroFile"}}, {
        "Wansmer/treesj",
        keys = {
            {"<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join"}
        },
        cmd = {"TSJToggle", "TSJSplit", "TSJJoin"},
        opts = {use_default_keymaps = false}
    }, {
        "Pocco81/true-zen.nvim",
        opts = function(_, opts)
            return utils.extend_tbl(opts, {
                integrations = {
                    tmux = os.getenv "TMUX" ~= nil, -- hide tmux status bar in (minimalist, ataraxis)
                    twilight = utils.is_available "twilight.nvim" -- enable twilight (ataraxis)
                }
            })
        end,
        keys = {
            {prefixz, desc = "True Zen"}, {
                prefixz .. "f",
                function() require("true-zen").focus() end,
                desc = "Focus (True Zen)"
            }, {
                prefixz .. "m",
                function() require("true-zen").minimalist() end,
                desc = "Minimalist (True Zen)"
            }, {
                prefixz .. "a",
                function() require("true-zen").ataraxis() end,
                desc = "Ataraxis (True Zen)"
            }, {
                prefixz .. "n",
                function()
                    local truezen = require "true-zen"
                    local first = 0
                    local last = vim.api.nvim_buf_line_count(0)
                    truezen.narrow(first, last)
                end,
                desc = "Narrow (True Zen)"
            }, {
                prefixz .. "n",
                function()
                    local truezen = require "true-zen"
                    local first = vim.fn.line "v"
                    local last = vim.fn.line "."
                    truezen.narrow(first, last)
                end,
                desc = "Narrow (True Zen)",
                mode = {"v"}
            }
        }
    }, {
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
                                    local status, node =
                                        pcall(vim.treesitter.get_node,
                                              {pos = {o.linenr - 1, o.col - 2}})
                                    return
                                        o.incmd or o.col == 1 or not status or
                                            not node or node:type() ~= "comment" and
                                            node:type() ~= "html_block"
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
    }, {"matze/vim-move", event = "BufEnter"}, {
        "kevinhwang91/nvim-hlslens",
        opts = {},
        event = "BufRead",
        init = function()
            vim.on_key(nil, vim.api.nvim_get_namespaces()["auto_hlsearch"])
        end
    }, {
        "machakann/vim-sandwich",
        keys = {
            {"sa", desc = "Add surrounding", mode = {"n", "v"}},
            {"sd", desc = "Delete surrounding"},
            {"sr", desc = "Replace surrounding"}
        }
    }, {"junegunn/vim-easy-align", event = "User AstroFile"}

}
