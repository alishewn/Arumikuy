return {
    {"NvChad/nvim-colorizer.lua", enabled = false}, {
        "uga-rosa/ccc.nvim",
        enabled = false,
        event = {"User AstroFile", "InsertEnter"},
        cmd = {
            "CccPick", "CccConvert", "CccHighlighterEnable",
            "CccHighlighterDisable", "CccHighlighterToggle"
        },
        keys = {
            {
                "<leader>uC",
                "<cmd>CccHighlighterToggle<cr>",
                desc = "Toggle colorizer"
            }, {"<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert color"},
            {"<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color"}
        },
        opts = {highlighter = {auto_enable = true, lsp = true}},
        config = function(_, opts)
            require("ccc").setup(opts)
            if opts.highlighter and opts.highlighter.auto_enable then
                vim.cmd.CccHighlighterEnable()
            end
        end
    }, {
        "lukas-reineke/headlines.nvim",
        enabled = false,
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = {"markdown", "norg", "org", "rmd"},
        opts = {}
    }, {
        "levouh/tint.nvim",
        enabled = false,
        event = "User AstroFile",
        opts = {
            highlight_ignore_patterns = {"WinSeparator", "neo-tree", "Status.*"},
            tint = -45, -- Darken colors, use a positive value to brighten
            saturation = 0.6 -- Saturation to preserve
        }
    }, {
        "folke/twilight.nvim",
        enabled = false,
        keys = {{"<leader>uT", "<cmd>Twilight<cr>", desc = "Toggle Twilight"}},
        cmd = {"Twilight", "TwilightEnable", "TwilightDisable"}
    }, {
        "azabiong/vim-highlighter",
        enabled = false,
        lazy = false, -- Not Lazy by default
        keys = {
            -- These are basing keymaps to guide new users
            {"f<Enter>", desc = "Highlight"},
            {"f<BS>", desc = "Remove Highlight"},
            {"f<C-L>", desc = "Clear Highlight"},
            {"f<Tab>", desc = "Find Highlight (similar to Telescope grep)"},
            -- They are derivated from the default keymaps, see README.md to github repo for documentation
            {"nn", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight"},
            {"ng", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight"},
            {"n[", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight"},
            {"n]", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight"}
        }
    }, {
        {"numToStr/Comment.nvim", enabled = false}, {
            "echasnovski/mini.comment",
            enabled = false,
            dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"},
            event = "User AstroFile",
            opts = {
                hooks = {
                    pre = function()
                        require("ts_context_commentstring.internal").update_commentstring {}
                    end
                }
            }
        }
    }

}
