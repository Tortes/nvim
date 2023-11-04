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

-- Setting for telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })

