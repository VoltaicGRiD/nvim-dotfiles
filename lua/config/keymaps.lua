-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local api = vim.api
local map = vim.keymap.set
local hop = require("hop")

-- Hop.nvim
map({ "n", "i", "o" }, "ghe", function()
  hop.hint_words({ hop.a, hint_position = require("hop.hint").HintPosition.END, hint_offset = 1 })
end, { noremap = true })
map({ "n", "o", "v" }, "ghw", "<cmd>HopWord<cr>", { noremap = true })
map({ "n", "o", "v" }, "ghj", "<cmd>HopLineStart<cr>", { noremap = true })
map({ "n", "o", "v" }, "gh/", "<cmd>HopPattern<cr>", { noremap = true })
map({ "n", "o", "v" }, "ghs", "<cmd>HopChar2<cr>", { noremap = true })
map({ "n", "o", "v" }, "<leader>jw", "<cmd>HopWord<cr>", { noremap = true })
map({ "n", "o", "v" }, "<leader>jj", "<cmd>HopLineStart<cr>", { noremap = true })
map({ "n", "o", "v" }, "<leader>j/", "<cmd>HopPattern<cr>", { noremap = true })
map({ "n", "o", "v" }, "<leader>js", "<cmd>HopChar2<cr>", { noremap = true })

-- Shiftwidth + Tabstop
map({ "n" }, "<leader>t2", "<cmd>set tabstop=2 shiftwidth=2<cr>", { noremap = true })
map({ "n" }, "<leader>t4", "<cmd>set tabstop=4 shiftwidth=4<cr>", { noremap = true })
map({ "n" }, "<leader>t8", "<cmd>set tabstop=8 shiftwidth=8<cr>", { noremap = true })
map({ "n" }, "<leader>to", function()
  vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { noremap = true })

-- Possession.nvim
map({ "n" }, "<leader>ox", ":PossessionSave! ", { desc = "Save session [name]", noremap = true })
map({ "n" }, "<leader>ol", function()
  require("telescope").extensions.possession.list()
end, { desc = "List sessions (telescope)", noremap = true })
map({ "n" }, "<leader>oo", ":PossessionLoad ", { desc = "Load session [name]", noremap = true })
map({ "n" }, "<leader>od", ":PossessionDelete ", { desc = "Delete session [name]", noremap = true })
map({ "n" }, "<leader>or", ":PossessionRename ", { desc = "Rename session [name] [new name]", noremap = true })

-- fixes
map({ "n" }, "<leader>r", "<cmd>redo<cr>", { noremap = true })
map({ "x" }, "<leader>p", [["_dP]])
map({ "n" }, "<leader><leader>g", "<cmd>Telescope live_grep<cr>", { noremap = true })
map({ "n" }, "<leader><leader>f", "<cmd>Telescope find_files<cr>", { noremap = true })
map({ "n" }, "<leader><leader>", function() end, { noremap = true })

-- Open Neotree
map("n", "<C-f>", "<cmd>Neotree<CR>", {})

-- Luasnip
map("n", "<leader>se", function()
  require("luasnip.loaders").edit_snippet_files()
end, { noremap = true })

map("n", "<leader>sE", function()
  local dir = vim.fn.stdpath("config") .. "\\luasnippets\\all.lua"
end, { noremap = true })

map("i", "<c-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>", { noremap = true })
map({ "i", "s" }, "<C-n>", "<Plug>luasnip-next-choice", {})
map({ "i", "s" }, "<C-p>", "<Plug>luasnip-prev-choice", {})

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

local wk = require("which-key")

wk.register({
  f = "which_key_ignore",
  g = "which_key_ignore",
}, { mode = "i" })
