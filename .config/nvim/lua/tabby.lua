local theme = {
  -- fill = 'TabLineFill',
  fill = { fg='#eeeeee', bg='#202328', style='italic' },
  head = { fg='#202328', bg='#202328', style='italic' },
  current_tab = { fg='#eeeeee', bg='#5E81AB', style='italic' },
  win = { fg='#202328', bg='#202328', style='italic' },
  tail = { fg='#202328', bg='#202328', style='italic' },
}

require('tabby.tabline').set(function(line)
  return {
    {
      -- { '  ', hl = theme.fill },
      { '  ', hl = { fg = '#eeeeee', bg = '#202328' } },
      line.sep('▊', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.fill
      return {
        line.sep('▊', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        line.sep('▊', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('▊', theme.win, theme.fill),
        -- win.is_current() and '' or '',
        win.is_current() and '' or '',
        win.buf_name(),
        margin = ' ',
      }
    end),
    {
      line.sep('▊', theme.tail, theme.fill),
      { '  ' },
    },
    hl = theme.fill,
  }
end)
