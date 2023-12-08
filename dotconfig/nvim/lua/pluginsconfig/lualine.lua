require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'powerline',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'packer', 'NvimTree',
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
	    { 'buffers',
	    symbols = {
		    modified = ' ●',      -- Text to show when the buffer is modified
		    alternate_file = '',  -- Text to show to identify the alternate filename
		    directory =  '',     -- Text to show when the buffer is a directory
	    },
	          filetype_names = {
			  NvimTree = 'NvimTree',
		  }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
    },
  },
},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
