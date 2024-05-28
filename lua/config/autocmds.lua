-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here-- Don't auto commenting new lines

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  callback = function()
    require("luasnip.loaders.from_snipmate").load({ paths = { "./snippets" } })
    require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
  end,
})
