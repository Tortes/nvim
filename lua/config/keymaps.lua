-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Setting for tree
tree_open = false
function toggle_tree()
  if tree_open then
    vim.cmd(":NvimTreeClose")
    tree_open = false
  else
    vim.cmd(":NvimTreeOpen")
    tree_open = true
  end
end

vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua toggle_tree()<CR>', { noremap = true, silent = true })

