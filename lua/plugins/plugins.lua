return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- friendly snippets
  { "rafamadriz/friendly-snippets" },

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require('luasnip').snippets = {
            lua = require('luasnip/loaders/from_vscode').load({ paths = { 'lua' } }),
            python = require('luasnip/loaders/from_vscode').load({ paths = { 'python' } }),
            cpp = require('luasnip/loaders/from_vscode').load({ paths = { 'cpp' } }),
        }
    end,
  },
}
