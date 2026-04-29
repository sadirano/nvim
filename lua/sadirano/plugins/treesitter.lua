return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local base_parsers = {
                "json",
                "sql",
                "yaml",
                "markdown",
                "bash",
                "lua",
                "vimdoc",
                "gitignore",
            }

            local profile_parsers = {
                web = { "javascript", "typescript", "html", "css" },
                rust = { "rust" },
                python = { "python" },
                go = { "go" },
            }

            local langs = require("sadirano.core.languages")
            local parsers = vim.deepcopy(base_parsers)
            for _, name in ipairs(langs.active_profiles) do
                for _, p in ipairs(profile_parsers[name] or {}) do
                    table.insert(parsers, p)
                end
            end

            require("nvim-treesitter").setup({
                ensure_installed = parsers,
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
