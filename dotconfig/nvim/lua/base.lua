vim.opt.encoding = "utf-8" -- Set encoding to utf-8
vim.opt.number = true -- Shownumber = true -- Show line numbers on the sidebar
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.hlsearch = true --Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Search ignoring case
vim.opt.smartcase = true -- Do not ignore case if the search pattern has uppercase
vim.opt.splitbelow = true -- Split below current window
vim.opt.splitright = true -- Split window to the right
vim.opt.cursorline = true -- Highlight the active cursor line

-- Set the undo directory
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = { prefix .. "/nvim/undodir//"}
vim.opt.undofile = true

vim.opt.termguicolors = true -- Enable 24-bit colors on terminal
vim.opt.wildmenu = true -- Enable wildmenu
vim.opt.wildmode = 'longest,list,full'
vim.opt.syntax = "ON" -- Allow syntax highlighting
vim.opt.completeopt = { "menuone", "noinsert" }


local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Remove end of buffer ~ on buffer enter 
autocmd('BufEnter', {
  pattern = '*',
  command = "let &fcs='eob: '"
})

-- Turn off line numbers on entering terminal
autocmd('TermOpen', {
	pattern = '*',
	command = 'setlocal nonumber norelativenumber'
})

-- Insert mode on entering terminal
autocmd('TermOpen', {
	pattern = '*',
	command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

-- Close terminal buffer on process exit
autocmd('TermClose', {
  pattern = 'term://*',
  command = 'call nvim_input("<CR>")'
})

-- Open Alpha if last buffer is closed ( Uses Bdelete and Bwipeout )
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "BDeletePost*",
  group = "alpha_on_empty",
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      vim.cmd("NvimTreeClose")
      vim.cmd("TagbarClose")
      vim.cmd("Alpha")
      vim.cmd(event.buf .. "bwipeout")
    end
  end,
})
