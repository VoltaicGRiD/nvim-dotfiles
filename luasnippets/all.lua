local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

return {
  s("harr", {
    t("`Harrier`"),
  }),
  s("harrc", {
    t("`Harrier-"),
    i(1),
    t("`"),
  }),
  ls.parser.parse_snippet("trig", "${1|This,That|} is a ${2:snippet}!"),
}, {}
