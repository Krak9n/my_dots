require('lualine').setup
{
  options = {
    icons_enabled = false,
    theme = 'moonfly',
    --[[theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },]]
    component_separators = '|',
    section_separators = { left = '◣', right = '◢'  },
    --component_separators = '>>',
    --section_separators = ,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    --lualine_y = {'progress'},
    --lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    --lualine_c = {'filename'},
    --lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'location', 'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', --[['fileformat']] 'filetype'},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}

  --[[ sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }]]
}
