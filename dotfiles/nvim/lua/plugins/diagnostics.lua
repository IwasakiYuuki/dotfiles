return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("trouble").setup {
        signs = {
          error = "",
          warning = "",
          hint = "",
        },
      }
      vim.cmd[[ sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl= ]]
      vim.cmd[[ sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl= ]]
      vim.cmd[[ sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl= ]]
      vim.cmd[[ sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl= ]]
    end,
  }
}
