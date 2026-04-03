return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP servers
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    -- Formatters
                    "prettier",
                    "stylua",
                    -- Linters
                    "eslint_d",
                },
            })
        end,
    },
}
