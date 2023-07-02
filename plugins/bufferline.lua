return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        show_tab_indicators = true,
        separator_style = "thick",
        indicator = {
          icon = '|',
          style = "icon",
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        }
      },
      highlights = {
        buffer_selected = {
          fg = "#094d99",
          italic = false,
          bold = true,
        },
      }
    }
  },
}
