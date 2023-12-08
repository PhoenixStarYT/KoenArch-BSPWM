local present, alpha = pcall(require, 'alpha')

if not present then
  return
end

local dashboard = require('alpha.themes.dashboard')
local fortune = require('alpha.fortune')

local logo = {
  type = 'text',
  val = {
    '                                                    ',
    ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
    ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
    ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
  },
  opts = {
    position = 'center',
    hl = 'DevIconDart',
  },
}

local function info_value()
  local total_plugins = " Total plugins " .. vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
  local datetime = os.date(' %d-%m-%Y')
  local version = vim.version()
  local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

  return datetime .. nvim_version_info .. ' ' .. total_plugins
end

local info = {
  type = 'text',
  val = info_value(),
  opts = {
    hl = 'DevIconVimrc',
    position = 'center',
  },
}

local message = {
  type = 'text',
  val = fortune({ max_width = 60 }),
  opts = {
    position = 'center',
    hl = 'SpecialComment',
  },
}

local header = {
  type = 'group',
  val = {
    logo,
    info,
  },
}

local buttons = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Actions',
      opts = {
        hl = 'String',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    dashboard.button("f", " " .. " Find file", ":Telescope find_files hidden=true no_ignore=true <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", "<cmd>lua require('telescope.builtin').live_grep({shorten_path=true})<CR>"),
    dashboard.button(
    'd',
    '  Dotfiles',
    "<cmd>lua require('telescope.builtin').find_files({ search_dirs = { os.getenv('HOME') .. '/.config' } })<CR>"
    ),
    dashboard.button("u", " " .. " Update plugins",   ":PackerSync<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  },
  opts = {
    position = 'center',
  },
}

local config = {
  layout = {
    { type = 'padding', val = 5 },
    header,
    { type = 'padding', val = 5 },
    buttons,
    { type = 'padding', val = 1 },
    message,
  },
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        desc = 'disable status, tabline and cmdline for alpha',
        callback = function()
          vim.go.laststatus = 0
          vim.opt.showtabline = 0
          vim.opt.cmdheight = 0
        end,
      })
      vim.api.nvim_create_autocmd('BufUnload', {
        buffer = 0,
        desc = 'enable status, tabline and cmdline after alpha',
        callback = function()
          vim.go.laststatus = 2
          vim.opt.showtabline = 2
          vim.opt.cmdheight = 1
        end,
      })
    end,
    margin = 5,
  },
}

alpha.setup(config)
