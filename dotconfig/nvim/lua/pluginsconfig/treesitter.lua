local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = "lua",
    highlight = {
        enable = true,
    },
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    }
