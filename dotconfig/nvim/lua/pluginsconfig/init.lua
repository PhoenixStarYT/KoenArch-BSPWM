local plugins = {
	'nvim-tree',
	'mason',
	'mason-lspconfig',
	'gruvbox',
	'lualine',
	'treesitter',
	'colorizer',
	'nvim-cmp',
	'telescope',
	'indent-blankline',
	'undotree',
	'Comment',
	'nvim-lspconfig',
	'lsp_lines',
	'alpha',
}

for _, plugin in ipairs(plugins) do
  pcall(require, "pluginsconfig." .. plugin)
end

