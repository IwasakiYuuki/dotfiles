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
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-null-ls").setup({
          ensure_installed = {},
          automatic_installation = false,
          handlers = {},
      })
      require("null-ls").setup({})
    end,
  }
}
