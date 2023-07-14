local utils = require "astronvim.utils"
return {
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        cond = not vim.g.neovide,
        -- enabled = false,
        opts = function()
            -- don't use animate when scrolling with the mouse
            local mouse_scrolled = false
            for _, scroll in ipairs {"Up", "Down"} do
                local key = "<ScrollWheel" .. scroll .. ">"
                vim.keymap.set({"", "i"}, key, function()
                    mouse_scrolled = true
                    return key
                end, {expr = true})
            end

            local animate = require "mini.animate"
            return {
                resize = {
                    timing = animate.gen_timing.linear {
                        duration = 100,
                        unit = "total"
                    }
                },
                scroll = {
                    timing = animate.gen_timing.linear {
                        duration = 150,
                        unit = "total"
                    },
                    subscroll = animate.gen_subscroll.equal {
                        predicate = function(total_scroll)
                            if mouse_scrolled then
                                mouse_scrolled = false
                                return false
                            end
                            return total_scroll > 1
                        end
                    }
                },
                cursor = {
                    timing = animate.gen_timing.linear {
                        duration = 80,
                        unit = "total"
                    }
                }
            }
        end
    }, {"karb94/neoscroll.nvim", event = "VeryLazy", opts = {}}, {
        "petertriho/nvim-scrollbar",
        opts = function(_, opts)
            require("astronvim.utils").extend_tbl(opts, {
                handlers = {
                    gitsigns = require("astronvim.utils").is_available "gitsigns.nvim",
                    search = require("astronvim.utils").is_available "nvim-hlslens",
                    ale = require("astronvim.utils").is_available "ale"
                }
            })
        end,
        event = "User AstroFile"
    }, {
        {
            -- scrollbar
            "lewis6991/satellite.nvim",
            event = "User AstroFile",
            opts = {
                excluded_filetypes = {
                    "prompt", "TelescopePrompt", "noice", "notify", "neo-tree"
                }
            }
        }, {
            "folke/zen-mode.nvim",
            optional = true,
            opts = function(_, opts)
                local old_on_open, old_on_close = opts.on_open, opts.on_close
                opts.on_open = function()
                    utils.conditional_func(old_on_open, true)
                    vim.cmd.SatelliteDisable()
                end
                opts.on_close = function()
                    utils.conditional_func(old_on_close, true)
                    vim.cmd.SatelliteEnable()
                end
            end
        }
    }, {"psliwka/vim-smoothie", event = "User AstroFile"}
}
