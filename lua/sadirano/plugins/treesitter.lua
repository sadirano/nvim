return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        lazy = false,
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

            local has_compiler = vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1 or vim.fn.executable("cl") == 1
            if has_compiler then
                require("nvim-treesitter.install").compilers = { "gcc", "clang", "cl" }
                require("nvim-treesitter.install").prefer_git = true
                require("nvim-treesitter.configs").setup({
                    ensure_installed = parsers,
                    highlight = { enable = true },
                    indent = { enable = true },
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
                            goto_next_start = {
                                ["]m"] = "@function.outer",
                                ["]]"] = "@class.outer",
                            },
                            goto_next_end = {
                                ["]M"] = "@function.outer",
                                ["]["] = "@class.outer",
                            },
                            goto_previous_start = {
                                ["[m"] = "@function.outer",
                                ["[["] = "@class.outer",
                            },
                            goto_previous_end = {
                                ["[M"] = "@function.outer",
                                ["[]"] = "@class.outer",
                            },
                        },
                    },
                })
            end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "master",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        -- Configured entirely inside nvim-treesitter.configs.setup
    },
    {
        "windwp/nvim-ts-autotag",
        enabled = vim.tbl_contains(require("sadirano.core.languages").active_profiles, "web"),
        event = "InsertEnter",
        config = true,
    },
}
