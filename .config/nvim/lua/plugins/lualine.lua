return {
  { "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    -- Editted by: driverag22
    local lualine = require('lualine')

    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      bg       = '#100f10',
      fg       = '#eeeeee',
      white    = '#eeeeee',
      black    = '#000000',
      yellow   = '#eecc00',
      cyan     = '#00d3d0',
      green    = '#00cd68',
      orange   = '#FF8800',
      violet   = '#b6a0ff',
      magenta  = '#f78fe7',
      blue     = '#2fafff',
      red      = '#ec5f67',
      normal   = '#2fafff',
      insert   = '#6ae4b9',
      visual   = '#b6a0ff',
      command  = '#ff8059',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Colors for different modes
    local mode_color = {
      n = colors.normal,
      i = colors.insert,
      v = colors.visual,
      [''] = colors.visual,
      V = colors.visual,
      c = colors.command,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { 
            a = { fg = colors.black, bg = colors.normal},
            c = { fg = colors.fg, bg = colors.bg} },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
            insert = { a = { fg = colors.black, bg = colors.insert } },
            visual = { a = { fg = colors.black, bg = colors.visual } },
            replace = { a = { fg = colors.black, bg = colors.violet } },
            command = { a = { fg = colors.black, bg = colors.command} },
          },
        },
        sections = {
          lualine_a = { 'mode' },
          -- these are to remove the defaults
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left {
        -- mode component
        function()
          return ''
        end,
        color = function()
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 1, right = 1 },
      }

      ins_left {
        -- filesize component
        'filesize',
        cond = conditions.buffer_not_empty,
      }

      ins_left {
        'filename',
        path = 4,
        file_status = true,
        cond = conditions.buffer_not_empty,
        -- color = { fg = colors.magenta, gui = 'bold' },
        color = { fg = colors.white, gui = 'bold' },
      }

      ins_left {
        function()
          return '▊'
        end,
        color = function()
          return { fg = mode_color[vim.fn.mode()] }
        end,
      }

      ins_left { 'location' }

      ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

      ins_right {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      }

      ins_right {
        function()
          return '▊'
        end,
        color = function()
          return { fg = mode_color[vim.fn.mode()] }
        end,
      }

      ins_right {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = 'LSP:',
        color = { fg = colors.white},
        padding = { right = 1 },
      }

      ins_right {
        'filetype',
        color = { gui = 'bold' },
      }

      ins_right {
        function()
          return '▊'
        end,
        color = function()
          return { fg = mode_color[vim.fn.mode()] }
        end,
      }

      ins_right {
        'branch',
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
      }

      ins_right {
        'diff',
        -- Is it me or the symbol for modified us really weird
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      lualine.setup(config)
    end,
  },
}

