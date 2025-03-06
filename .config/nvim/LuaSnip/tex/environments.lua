-- Necessary abbreviations
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- For visual snippets
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
s({trig = "mm", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        [[
            \begin{equation*}
            \begin{gathered}
                <>
            \end{gathered}
            \end{equation*}
        ]],
        {
            d(1, get_visual),
        }
    )
),

s({trig = 'beg', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        [[
            \begin{<>}
                <>
            \end{<>}
        ]],
        {
            i(1),
            i(2),
            rep(1)
        }
    )
),

s({trig = "ff", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\frac{<>}{<>}",
        {
            i(1),
            i(2)
        }
    )
),

s({trig = 'bit', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        [[
            \begin{enumerate}[-]
                \itemsep1em
                \item <>
            \end{enumerate}
        ]],
        {
            i(1),
        }
    )
),

s({trig = 'ble', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        [[
            \begin{enumerate}[(a)]
                \itemsep1em
                \item <>
            \end{enumerate}
        ]],
        {
            i(1),
        }
    )
),

}
