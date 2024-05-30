require("luasnip.loaders.from_vscode").load({ paths = { "/snippets" } })
require("luasnip.loaders.from_snipmate").load({ path = { "/snippets" } })
require("luasnip.loaders.from_lua").load({ path = { vim.fn.stdpath("config") .. "\\luasnippets" } })

-- require("mason-lspconfig").setup_handlers({
--   ["roslyn"] = function()
--     require("lspconfig")["roslyn"].setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--       -- root_dir = function(fname)
--       --   local primary = require("lspconfig").util.root_pattern("*.sln")(fname)
--       --   local fallback = require("lspconfig").util.root_pattern("*.csproj")(fname)
--       --   return primary or fallback
--       -- end,
--       -- handlers = vim.tbl_extend("force", round_border_handlers, {
--       --   ["textDocument/definition"] = require("omnisharp_extended").handler,
--       -- }),
--     })
--   end,
-- })

local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
  capabilities = capabilities,
  cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  root_dir = function()
    return vim.loop.cwd() -- current working directory
  end,
})
