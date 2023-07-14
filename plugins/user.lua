return {
    {
        "williamboman/mason.nvim",
        opts = {
            github = {
                download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s"
            }
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User AstroFile",
        opts = function(_, opts)
            return require("astronvim.utils").extend_tbl(opts, {
                char = "│",
                show_trailing_blankline_indent = false,
                show_current_context = false
            })
        end
    },
    -- active indent guide and indent text objects
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "User AstroFile",
        opts = {
            symbol = "╎",
            options = {try_as_border = false, indent_at_cursor = true}
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy",
                    "mason", "startify", "aerial", "neogitstatus", "NvimTree"
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end
            })
        end
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
