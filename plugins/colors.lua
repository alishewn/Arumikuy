return {
    {
        {"NvChad/nvim-colorizer.lua", enabled = false}, {
            "uga-rosa/ccc.nvim",
            event = {"User AstroFile", "InsertEnter"},
            cmd = {
                "CccPick", "CccConvert", "CccHighlighterEnable",
                "CccHighlighterDisable", "CccHighlighterToggle"
            },
            opts = {highlighter = {auto_enable = true, lsp = true}},
            config = function(_, opts)
                require("ccc").setup(opts)
                if opts.highlighter and opts.highlighter.auto_enable then
                    vim.cmd.CccHighlighterEnable()
                end
            end
        }
    }, {
        {
            "levouh/tint.nvim",
            event = "User AstroFile",
            opts = {
                highlight_ignore_patterns = {
                    "WinSeparator", "neo-tree", "Status.*"
                },
                tint = -45, -- Darken colors, use a positive value to brighten
                saturation = 0.6 -- Saturation to preserve
            }
        }
    }, {
        {
            "folke/twilight.nvim",
            keys = {
                {"<leader>uT", "<cmd>Twilight<cr>", desc = "Toggle Twilight"}
            },
            cmd = {"Twilight", "TwilightEnable", "TwilightDisable"}
        }
    }, {
        {
            "azabiong/vim-highlighter",
            lazy = false,
            keys = {
                {"f<Enter>", desc = "Highlight"},
                {"f<BS>", desc = "Remove Highlight"},
                {"f<C-L>", desc = "Clear Highlight"},
                {"f<Tab>", desc = "Find Highlight (similar to Telescope grep)"},
                {"nn", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight"},
                {"ng", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight"},
                {"n[", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight"},
                {"n]", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight"}
            }
        }
    }
}
