return {
    {"willothy/flatten.nvim", opts = {}, lazy = false, priority = 1001},
    {"jabirali/vim-tmux-yank", event = "User AstroFile"},
    {"vimpostor/vim-tpipeline", lazy = false}, {
        "aserowy/tmux.nvim",
        opts = {
            copy_sync = {enable = false},
            navigation = {enable_default_keybindings = false},
            resize = {enable_default_keybindings = false}
        },
        lazy = false
    }
}
