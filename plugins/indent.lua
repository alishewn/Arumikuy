return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User AstroFile",
        opts = {
            char = "│",
            filetype_exclude = {
                "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy"
            },
            show_trailing_blankline_indent = false,
            show_current_context = false
        }
    }, {
        "arsham/indent-tools.nvim",
        dependencies = {"arsham/arshlib.nvim"},
        event = "User AstroFile",
        config = function() require("indent-tools").config {} end
    }, {
        "echasnovski/mini.indentscope",
        event = "User AstroFile",
        opts = {symbol = "│", options = {try_as_border = true}},
        config = function(_, opts)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "fzf", "starter", "help", "alpha", "dashboard", "neo-tree",
                    "Trouble", "lazy", "mason"
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end
            })
            require("mini.indentscope").setup(opts)
        end
    }
}
