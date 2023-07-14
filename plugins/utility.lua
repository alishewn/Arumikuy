return {
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
        opts = {
            alpha = 0.75,
            blend_color = "#000000",
            update_in_insert = {enable = true, delay = 100},
            hide = {virtual_text = true, signs = true, underline = true}
        }
    }, {
        "nguyenvukhang/nvim-toggler",
        event = {"User AstroFile", "InsertEnter"},
        opts = {}
    }, {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-telescope/telescope-fzy-native.nvim"},
        opts = function()
            require("telescope").load_extension "fzy_native"
        end
    }, {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-telescope/telescope-live-grep-args.nvim"},
        opts = function()
            require("telescope").load_extension "live_grep_args"
        end
    }

}
