return {
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        themable = true,
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        indicator = { style = "none" },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "none",
        diagnostics_update_in_insert = false,
        color_icons = true,
        get_element_icon = function(element)
          local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
      },
      highlights = {
        buffer_selected = {
          fg = "#ff8059",
          bold = true,
          italic = false,
        },
      },
    })
  end
  }
}
