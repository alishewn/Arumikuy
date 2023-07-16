for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub(
                                  "https://github.com/",
                                  "https://hub.gitmirror.com/https://github.com/")
end

require'nvim-treesitter.configs'.setup {
    --
    --
}
return {}
