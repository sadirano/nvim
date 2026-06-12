return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
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

            require("nvim-treesitter").install(parsers)

            -- The main branch no longer enables features itself; start
            -- highlighting and treesitter indent per buffer when a parser exists
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    local lang = vim.treesitter.language.get_lang(ev.match)
                    if lang and pcall(vim.treesitter.start, ev.buf, lang) then
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
                move = { set_jumps = true },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local function sel(lhs, query)
                vim.keymap.set({ "x", "o" }, lhs, function()
                    select.select_textobject(query, "textobjects")
                end, { desc = "Select " .. query })
            end
            sel("af", "@function.outer")
            sel("if", "@function.inner")
            sel("ac", "@class.outer")
            sel("ic", "@class.inner")
            sel("aa", "@parameter.outer")
            sel("ia", "@parameter.inner")

            local move = require("nvim-treesitter-textobjects.move")
            local function mv(lhs, fn, query)
                vim.keymap.set({ "n", "x", "o" }, lhs, function()
                    move[fn](query, "textobjects")
                end, { desc = query .. " (" .. fn .. ")" })
            end
            mv("]m", "goto_next_start", "@function.outer")
            mv("]]", "goto_next_start", "@class.outer")
            mv("]M", "goto_next_end", "@function.outer")
            mv("][", "goto_next_end", "@class.outer")
            mv("[m", "goto_previous_start", "@function.outer")
            mv("[[", "goto_previous_start", "@class.outer")
            mv("[M", "goto_previous_end", "@function.outer")
            mv("[]", "goto_previous_end", "@class.outer")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        enabled = vim.tbl_contains(require("sadirano.core.languages").active_profiles, "web"),
        event = "InsertEnter",
        config = true,
    },
}
