require("luasnip.loaders.from_vscode").load({ paths = { "/snippets" } })
require("luasnip.loaders.from_snipmate").load({ path = { "/snippets" } })
require("luasnip.loaders.from_lua").load({ path = { vim.fn.stdpath("config") .. "\\luasnippets" } })
