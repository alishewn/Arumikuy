-- local opts = {
--   git = {
--     url_format = 'https://ghproxy.com/https://github.com/%s.git'
--   }
-- }
-- require('lazy').setup('plugins', opts)

return{
  {
    "folke/lazy.nvim",
    opts = {
      git = {
        url_format = 'https://ghproxy.com/https://github.com/%s.git',
      },
    },
  },
}
