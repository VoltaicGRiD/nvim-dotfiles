-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Hop.nvim
map({ "n", "i" }, "ghw", "<cmd>:HopWord<cr>", { noremap = true })
map({ "n", "i" }, "ghj", "<cmd>:HopLineStart<cr>", { noremap = true })
map({ "n", "i" }, "gh/", "<cmd>:HopPattern<cr>", { noremap = true })
map({ "n", "i" }, "ghs", "<cmd>:HopChar2<cr>", { noremap = true })

-- Open Neotree
map("n", "<C-f>", ":Neotree<CR>", {})

-- Exit insert mode and save file 'fds'
map({ "i", "n" }, "fds", function()
  vim.cmd("write")
  vim.cmd("stopinsert")
  print("Saved file: " .. vim.fn.expand("%:p"))
end, { noremap = true, silent = true })

-- Exit insert mode and do NOT save file 'fd'
map("i", "fd", function()
  vim.cmd("stopinsert")
  print("Exited insert mode without saving")
end, { noremap = true, silent = true })

require("which-key").register({
  f = "which_key_ignore",
}, { mode = "i" })
