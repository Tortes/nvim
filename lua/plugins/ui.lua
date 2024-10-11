return {
  {
    "lewis6991/gitsigns.nvim",
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        -- signs = {
        --   add          = { hl = 'GitSignsAdd', text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        --   change       = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        --   delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        --   topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        --   changedelete = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        --   untracked    = { hl = 'GitSignsAdd', text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        -- },
      }
      vim.keymap.set("n", "<leader>g-", ":Gitsigns prev_hunk<CR>", { silent = true })
      vim.keymap.set("n", "<leader>g=", ":Gitsigns next_hunk<CR>", { silent = true })
      vim.keymap.set("n", "<leader>H", ":Gitsigns preview_hunk_inline<CR>", { noremap = true, silent = true })
    end
  },
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = function()
  --     require('indent_blankline').setup({
  --       -- 你可以在这里添加你的个性化设置
  --       char = '|', -- 定制缩进线字符，可以是 '|', '┆', '┊', 等
  --       show_trailing_blankline_indent = false, -- 不显示结尾的缩进线
  --       show_first_indent_level = true, -- 显示第一层的缩进
  --       use_treesitter = true, -- 启用 Treesitter 解析
  --       show_current_context = true, -- 显示当前上下文
  --     })
  --   end
  -- },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- {
  --   'nvimdev/indentmini.nvim',
  --   event = 'BufEnter',
  --   config = function()
  --     require("indentmini").setup({
  --       char = "│",
  --       exclude = {
  --         "help",
  --         "dashboard",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --         "markdown",
  --       }
  --     })
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cpp",
          "go",
          --"lua",
          "python",
          "vim"
        },
        highlight = {
          enable = true,
          disable = {}, -- list of language that will be disabled
        },
        indent = {
          enable = false
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            --init_selection    = "<c-n>",
            --node_incremental  = "<c-n>",
            node_decremental  = "<c-h>",
            scope_incremental = "<c-l>",
          },
        }
      })
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = 'BufRead',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterBlue',
          'RainbowDelimiterYellow',
          'RainbowDelimiterCyan',
          'RainbowDelimiterViolet',
          'RainbowDelimiterRed',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
        },
      }
    end
  },
  { 
    "sitiom/nvim-numbertoggle",
    lazy = false,
    -- event = "VeryLazy",
    enabled = true,
  },
}
