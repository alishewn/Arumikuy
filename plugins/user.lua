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
    }
}
