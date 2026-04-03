return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "json",
                    "sql",
                    "javascript",
                    "typescript",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "bash",
                    "lua",
                    "vimdoc",
                    "gitignore",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
}
