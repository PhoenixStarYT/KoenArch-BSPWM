local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

Close nvim-tree if last window remaining
autocmd('BufEnter', {
	pattern = '*',
	command = 'if (winnr("$") ==1 && &filetype == "nvimtree") | q | endif'
})

require('nvim-tree').setup {
}
