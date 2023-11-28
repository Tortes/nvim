-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


-- Tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- System clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Disable netrw(for nvim tree)
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
