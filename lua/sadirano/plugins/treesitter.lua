return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
                sadirano = { "python", "go", "bash", "lua" },
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
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
                        goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
                        goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
                        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
                    },
                },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
}
