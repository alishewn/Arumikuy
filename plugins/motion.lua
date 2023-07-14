local prefix = "<leader><leader>"
local maps = {n = {}}
local icon = vim.g.icons_enabled and "󰛢 " or ""
maps.n[prefix] = {desc = icon .. "Grapple"}
require("astronvim.utils").set_mappings(maps)
return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        opts = {},
        keys = {
            {
                "s",
                mode = {"n", "x", "o"},
                function() require("flash").jump() end,
                desc = "Flash"
            }, {
                "S",
                mode = {"n", "o", "x"},
                function() require("flash").treesitter() end,
                desc = "Flash Treesitter"
            }, {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc = "Remote Flash"
            }, {
                "R",
                mode = {"o", "x"},
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search"
            }
        }
    }, {
        {
            "ggandor/flit.nvim",
            keys = function()
                ---@type LazyKeys[]
                local ret = {}
                for _, key in ipairs {"f", "F", "t", "T"} do
                    ret[#ret + 1] = {key, mode = {"n", "x", "o"}, desc = key}
                end
                return ret
            end,
            opts = {labeled_modes = "nx"},
            dependencies = {
                "ggandor/leap.nvim",
                dependencies = {"tpope/vim-repeat"}
            }
        }
    }, {
        "cbochs/grapple.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = {"Grapple"},
        keys = {
            {prefix .. "a", "<cmd>GrappleTag<CR>", desc = "Add file"},
            {prefix .. "d", "<cmd>GrappleUntag<CR>", desc = "Remove file"},
            {prefix .. "t", "<cmd>GrappleToggle<CR>", desc = "Toggle a file"},
            {
                prefix .. "e",
                "<cmd>GrapplePopup tags<CR>",
                desc = "Select from tags"
            }, {
                prefix .. "s",
                "<cmd>GrapplePopup scopes<CR>",
                desc = "Select a project scope"
            }, {
                prefix .. "x",
                "<cmd>GrappleReset<CR>",
                desc = "Clear tags from current project"
            },
            {"<C-n>", "<cmd>GrappleCycle forward<CR>", desc = "Select next tag"},
            {
                "<C-p>",
                "<cmd>GrappleCycle backward<CR>",
                desc = "Select previous tag"
            }
        }
    }, {
        "phaazon/hop.nvim",
        opts = {},
        keys = {
            {
                "s",
                function() require("hop").hint_words() end,
                mode = {"n"},
                desc = "Hop hint words"
            }, {
                "<S-s>",
                function() require("hop").hint_lines() end,
                mode = {"n"},
                desc = "Hop hint lines"
            }, {
                "s",
                function()
                    require("hop").hint_words {extend_visual = true}
                end,
                mode = {"v"},
                desc = "Hop hint words"
            }, {
                "<S-s>",
                function()
                    require("hop").hint_lines {extend_visual = true}
                end,
                mode = {"v"},
                desc = "Hop hint lines"
            }
        }
    }, {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {}
    }, {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {"andymass/vim-matchup"},
        init = function()
            vim.g.matchup_matchparen_offscreen = {method = "popup"}
            vim.g.matchup_matchparen_deferred = 1
        end,
        opts = {matchup = {enable = true}}
    }, {
        "ggandor/leap.nvim",
        keys = {
            {
                "s",
                "<Plug>(leap-forward-to)",
                mode = {"n", "x", "o"},
                desc = "Leap forward to"
            }, {
                "S",
                "<Plug>(leap-backward-to)",
                mode = {"n", "x", "o"},
                desc = "Leap backward to"
            }, {
                "x",
                "<Plug>(leap-forward-till)",
                mode = {"x", "o"},
                desc = "Leap forward till"
            }, {
                "X",
                "<Plug>(leap-backward-till)",
                mode = {"x", "o"},
                desc = "Leap backward till"
            }, {
                "gs",
                "<Plug>(leap-from-window)",
                mode = {"n", "x", "o"},
                desc = "Leap from window"
            }
        },
        opts = {},
        init = function() -- https://github.com/ggandor/leap.nvim/issues/70#issuecomment-1521177534
            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    vim.cmd.hi("Cursor", "blend=100")
                    vim.opt.guicursor:append{"a:Cursor/lCursor"}
                end,
                pattern = "LeapEnter"
            })
            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    vim.cmd.hi("Cursor", "blend=0")
                    vim.opt.guicursor:remove{"a:Cursor/lCursor"}
                end,
                pattern = "LeapLeave"
            })
        end,
        dependencies = {"tpope/vim-repeat"}
    }, {"romainl/vim-cool", event = "User AstroFile"}

}
