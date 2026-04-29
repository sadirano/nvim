local M = {}

-- Default profiles — override per-machine in lua/sadirano/local/profiles.lua
M.active_profiles = { "web" }

local ok, local_profiles = pcall(require, "sadirano.local.profiles")
if ok and local_profiles.active_profiles then
    M.active_profiles = local_profiles.active_profiles
end

-- Core is always active (Lua/Neovim config tooling)
M.core = {
    lsp = { "lua_ls" },
    tools = { "lua_ls", "stylua" },
    formatters = { lua = { "stylua" } },
}

-- Always-on formatters regardless of profile
local always_formatters = {
    xml = { "xmlformat" },
    sql = { "sql_formatter" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
}

local always_tools = { "xmlformatter", "sql-formatter", "prettier" }

M.profiles = {
    web = {
        lsp = { "ts_ls" },
        tools = { "ts_ls", "prettier", "eslint_d" },
        formatters = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
        },
        linters = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
        },
    },
    rust = {
        lsp = { "rust_analyzer" },
        tools = { "rust_analyzer" },
        formatters = {},
        linters = {},
    },
    python = {
        lsp = { "pyright" },
        tools = { "pyright", "black" },
        formatters = { python = { "black" } },
        linters = {},
    },
    go = {
        lsp = { "gopls" },
        tools = { "gopls", "goimports" },
        formatters = { go = { "goimports" } },
        linters = {},
    },
}

function M.get_lsp_servers()
    local servers = vim.deepcopy(M.core.lsp)
    for _, name in ipairs(M.active_profiles) do
        local p = M.profiles[name]
        if p then
            for _, s in ipairs(p.lsp or {}) do
                table.insert(servers, s)
            end
        end
    end
    return servers
end

function M.get_tools()
    local tools = vim.deepcopy(M.core.tools)
    for _, t in ipairs(always_tools) do
        table.insert(tools, t)
    end
    for _, name in ipairs(M.active_profiles) do
        local p = M.profiles[name]
        if p then
            for _, t in ipairs(p.tools or {}) do
                table.insert(tools, t)
            end
        end
    end
    return tools
end

function M.get_formatters()
    local fmts = vim.deepcopy(M.core.formatters)
    for ft, f in pairs(always_formatters) do
        fmts[ft] = f
    end
    for _, name in ipairs(M.active_profiles) do
        local p = M.profiles[name]
        if p then
            for ft, f in pairs(p.formatters or {}) do
                fmts[ft] = f
            end
        end
    end
    return fmts
end

function M.get_linters()
    local linters = {}
    for _, name in ipairs(M.active_profiles) do
        local p = M.profiles[name]
        if p then
            for ft, l in pairs(p.linters or {}) do
                linters[ft] = l
            end
        end
    end
    return linters
end

return M
