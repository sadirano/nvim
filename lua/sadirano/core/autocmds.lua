local langs = require("sadirano.core.languages")

-- check if a profile is active
local function is_profile_active(name)
    for _, profile in ipairs(langs.active_profiles) do
        if profile == name then
            return true
        end
    end
    return false
end

-- spell + wrap for prose files (if prose or sadirano profile active)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        if is_profile_active("prose") or is_profile_active("sadirano") then
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
            vim.opt_local.spelllang = "en,pt_br"
        end
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
    local status = diagnostics_enabled and "enabled" or "disabled"
    vim.notify("Diagnostics " .. status, vim.log.levels.INFO, { title = "LSP" })
end, {})

-- Enable gj/gk movement if 'editor' or 'sadirano' profile is active
if is_profile_active("editor") or is_profile_active("sadirano") then
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
end

-- Command to toggle profiles at runtime
vim.api.nvim_create_user_command("ToggleProfile", function(opts)
    local profile_name = opts.args
    if profile_name == "" then
        vim.notify("Usage: :ToggleProfile <name>", vim.log.levels.WARN)
        return
    end

    local active = langs.active_profiles
    local found_idx = nil
    for i, name in ipairs(active) do
        if name == profile_name then
            found_idx = i
            break
        end
    end

    if found_idx then
        table.remove(active, found_idx)
        vim.notify("Profile '" .. profile_name .. "' disabled", vim.log.levels.INFO, { title = "Profiles" })
    else
        table.insert(active, profile_name)
        vim.notify("Profile '" .. profile_name .. "' enabled", vim.log.levels.INFO, { title = "Profiles" })
    end

    -- Trigger LSP and Tool refresh if LspRestart is available
    pcall(vim.cmd, "LspRestart")
end, {
    nargs = 1,
    complete = function()
        local available = {}
        for name, _ in pairs(langs.profiles) do
            table.insert(available, name)
        end
        table.insert(available, "editor")
        table.insert(available, "prose")
        return available
    end,
    desc = "Toggle a language profile (e.g. web, rust, editor)",
})
