return {
    {
        "kevinhwang91/nvim-hlslens",
        opts = {},
        event = "BufRead",
        init = function()
            vim.on_key(nil, vim.api.nvim_get_namespaces()["auto_hlsearch"])
        end
    }, {
        {
            "ray-x/sad.nvim",
            dependencies = {"ray-x/guihua.lua", build = "cd lua/fzy && make"},
            opts = {},
            event = "User AstroFile",
            cmd = {"Sad"}
        }
    }
}
