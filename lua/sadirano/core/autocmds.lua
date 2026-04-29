-- spell + wrap for prose files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en,pt_br"
    end,
})

-- line wrap in telescope preview
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- make '-' part of word motions only in web/styling filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        vim.opt_local.iskeyword:append("-")
    end,
})

-- toggle diagnostics on/off
local diagnostics_enabled = true
vim.api.nvim_create_user_command("ToggleDiagnostics", function()
    diagnostics_enabled = not diagnostics_enabled
    vim.diagnostic.enable(diagnostics_enabled)
end, {})
