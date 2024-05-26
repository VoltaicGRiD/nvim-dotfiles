-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local o = vim.o

opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 15
opt.colorcolumn = { 80, 120 }
opt.list = true
opt.listchars = { tab = "-->", multispace = " ", trail = "", extends = "⟩", precedes = "⟨" }
opt.jumpoptions = "stack,view"
opt.foldmethod = "indent"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.undofile = true
opt.inccommand = "split"

o.shell = "powershell"
o.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
o.shellquote = ""
o.shellxquote = ""
