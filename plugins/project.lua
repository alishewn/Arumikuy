local prefix = "<leader>s"
local maps = {n = {}, x = {}}

local icon = vim.g.icons_enabled and "󰛔 " or ""
maps.n[prefix] = {desc = icon .. "Search / Replace"}
maps.x[prefix] = {desc = icon .. "Search / Replace"}

require("astronvim.utils").set_mappings(maps)
return {
    {
        {
            "nvim-pack/nvim-spectre",
            cmd = "Spectre",
            keys = {
                {
                    prefix .. "s",
                    function() require("spectre").toggle() end,
                    desc = "Toggle Spectre"
                }, {
                    prefix .. "w",
                    mode = "x",
                    function()
                        require("spectre").open_visual {select_word = true}
                    end,
                    desc = "Spectre (current word)"
                }, {
                    prefix .. "f",
                    function()
                        require("spectre").open_file_search()
                    end,
                    desc = "Spectre (current file)"
                }
            },

            opts = function()
                return {
                    mapping = {
                        send_to_qf = {map = "q"},
                        replace_cmd = {map = "c"},
                        show_option_menu = {map = "o"},
                        run_current_replace = {map = "C"},
                        run_replace = {map = "R"},
                        change_view_mode = {map = "v"},
                        resume_last_search = {map = "l"}
                    }
                }
            end
        }, {
            "folke/edgy.nvim",
            optional = true,
            opts = function(_, opts)
                if not opts.bottom then opts.bottom = {} end
                table.insert(opts.bottom, {
                    ft = "spectre_panel",
                    title = "Search/Replace",
                    size = {height = 0.4}
                })
            end
        }
    },
    {
        {
            "jay-babu/project.nvim",
            name = "project_nvim",
            event = "VeryLazy",
            opts = {ignore_lsp = {"lua_ls"}, manual_mode = true }
        }, {
            "nvim-telescope/telescope.nvim",
            optional = true,
            dependencies = {"project_nvim"},
            opts = function()
                require("telescope").load_extension "projects"
            end
        }
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {"anuvyklack/middleclass", "anuvyklack/animation.nvim"},
        opts = {},
        cmd = {
            "WindowsMaximize", "WindowsMaximizeVertically",
            "WindowsMaximizeHorizontally", "WindowsEqualize",
            "WindowsEnableAutowidth", "WindowsDisableAutowidth",
            "WindowsToggleAutowidth"
        },
        init = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
        end
    }
}
