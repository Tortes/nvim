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

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua toggle_tree()<CR>', { noremap = true, silent = true })

-- Setting for telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })

-- Shortkeys
local mode_n    = { 'n' }
local mode_v    = { 'v' }
local mode_i    = { 'i' }
local mode_t    = { 't' }
local mode_nv   = { 'n', 'v' }
local nmappings = {
  -- base
  { from = 'W',                to = '<cmd>w<CR>',                                         mode = mode_n  },
  { from = 'Q',                to = '<cmd>q<CR>',                                         mode = mode_n  },
  { from = 'Y',                to = '"+y',                                                mode = mode_v  },
  { from = 'ca',               to = '<cmd>silent %y+<CR>',                                mode = mode_n  },
  -- move
  { from = 'j',                to = 'gj',                                                 mode = mode_n  },
  { from = 'k',                to = 'gk',                                                 mode = mode_n  },
  { from = '<A-l>',            to = '<Right>',                                            mode = mode_i  },
  { from = '<A-j>',            to = '<cmd>m .+1<cr>==',                                   mode = mode_n  },
  { from = '<A-k>',            to = '<cmd>m .-2<cr>==',                                   mode = mode_n  },
  { from = '<A-j>',            to = ':m \'>+1<cr>gv=gv',                                  mode = mode_v  },
  { from = '<A-k>',            to = ':m \'<-2<cr>gv=gv',                                  mode = mode_v  },
  -- windows splits
  { from = 'sh',               to = '<cmd>set nosplitright<CR>:vsplit<CR>',               mode = mode_n  },
  { from = 'sj',               to = '<cmd>set splitbelow<CR>:split<CR>',                  mode = mode_n  },
  { from = 'sk',               to = '<cmd>set nosplitbelow<CR>:split<CR>',                mode = mode_n  },
  { from = 'sl',               to = '<cmd>set splitright<CR>:vsplit<CR>',                 mode = mode_n  },
  { from = 'smv',              to = '<C-w>t<c-W>H',                                       mode = mode_n  },
  { from = 'smh',              to = '<C-w>t<c-W>K',                                       mode = mode_n  },
  { from = '<leader>W',        to = '<c-w>w',                                             mode = mode_n  },
  { from = '<leader>h',        to = '<c-w>h',                                             mode = mode_n  },
  { from = '<leader>j',        to = '<c-w>j',                                             mode = mode_n  },
  { from = '<leader>k',        to = '<c-w>k',                                             mode = mode_n  },
  { from = '<leader>l',        to = '<c-w>l',                                             mode = mode_n  },
    -- buffers & tab
  { from = 'tn',               to = '<cmd>tabnext<CR>',                                   mode = mode_n  },
  { from = 'tp',               to = '<cmd>tabprevious<CR>',                               mode = mode_n  },
  { from = 'tu',               to = '<cmd>tabnew<CR>',                                    mode = mode_n  },
  { from = 'tt',               to = '<cmd>silent 20 Lex<CR>',                             mode = mode_n  },
  --{ from = '<up>',             to = '<cmd>res +5<CR>',                                    mode = mode_n  },
  --{ from = '<down>',           to = '<cmd>res -5<CR>',                                    mode = mode_n  },
  --{ from = '<left>',           to = '<cmd>vertical resize-5<CR>',                         mode = mode_n  },
  --{ from = '<right>',          to = '<cmd>vertical resize+5<CR>',                         mode = mode_n  },
  { from = '<leader>vim',      to = '<cmd>edit ~/.config/nvim/init.lua<CR>',              mode = mode_n  },
}
for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or 'n', mapping.from, mapping.to, { noremap = true })
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function()
    for _, mapping in ipairs(MdSnippets) do
     vim.keymap.set(mapping.mode or 'n', mapping.from, mapping.to, { noremap = true, buffer = true })
    end
  end
})
