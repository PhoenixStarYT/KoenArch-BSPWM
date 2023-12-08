function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Toggle line numbers
map("n", "<F4>", "<cmd>:set number!<cr>", { silent = true })
-- Toggle IndentBlankline
map("n", "<F5>", "<cmd>:IndentBlanklineToggle<cr>", { silent = true })
-- Toggle Undotree
map("n", "<F6>", "<cmd>:lua require('undotree').toggle()<cr>", { silent = true })
-- Toggle Nvim Tree
map("n", "<F7>", "<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", { silent = true })
-- Toggle Tagbar
map("n", "<F8>", "<cmd>:TagbarToggle<cr>", { silent = true })
-- Toggle Tagbar
map("n", "<F8>", "<cmd>:TagbarToggle<cr>", { silent = true })
-- Toggle lsp_lines
vim.keymap.set("", "<F12>", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

