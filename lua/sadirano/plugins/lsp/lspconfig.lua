return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        -- Keymaps set on every LSP attach
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf, remap = false }
                local keymap = vim.keymap

                keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
                keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Implementations" }))
                keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "References" }))
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Type definitions" }))
                keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
                keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
                keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, vim.tbl_extend("force", opts, { desc = "Workspace symbol" }))
                keymap.set("n", "<leader>dd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Buffer diagnostics" }))
                keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
                keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            end,
        })

        -- Diagnostic display
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "E",
                    [vim.diagnostic.severity.WARN] = "W",
                    [vim.diagnostic.severity.HINT] = "H",
                    [vim.diagnostic.severity.INFO] = "I",
                },
            },
        })

        -- Shared capabilities for all servers
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Per-server overrides
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        -- Enable servers from active language profiles
        vim.lsp.enable(require("sadirano.core.languages").get_lsp_servers())
    end,
}
