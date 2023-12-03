return {
  {
    "windwp/nvim-autopairs",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
  {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    kay = { "<leader>cc" },
    opts = {
      mappings = {
        comment_line = "<leader>cc",
        comment_visual = '<leader>cc',
      }
    },
  },
}

