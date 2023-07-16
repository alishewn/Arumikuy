return {
    {
        "williamboman/mason.nvim",
        opts = {
            github = {
                download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s"
            }
        }
    },
    updater = {
        channel = "nightly",
        remote = "origin",
        version = "latest",
        branch = "main",
        commit = nil,
        pin_plugins = nil,
        skip_prompts = false,
        show_changelog = true,
        auto_quit = false
    },
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
        opts = {
            alpha = 0.75,
            blend_color = "#000000",
            update_in_insert = {enable = true, delay = 100},
            hide = {virtual_text = true, signs = true, underline = true}
        }
    },
    {
        "nguyenvukhang/nvim-toggler",
        event = {"User AstroFile", "InsertEnter"},
        opts = {}
    }
}
