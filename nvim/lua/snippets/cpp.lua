local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('cpp', {
  -- DP Template Snippet
  s('memo', {
    t {
      'int n;',
      'cin >> n;',
      'vi arr(n);',
      'cin >> arr;',
      'vector dp(n+1);',
      '',
      'auto go = [&](auto &&go, int i) -> int {',
      '    ',
    },
    i(1),
    t { '', '};', '', 'cout << go(go, 0, 0);' },
  }),
})
