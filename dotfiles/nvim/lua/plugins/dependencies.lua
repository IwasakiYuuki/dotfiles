return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        fps = 60,
        stages = "static"
      })
    end
  },
}
