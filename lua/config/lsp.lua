-- ~/.config/nvim/lua/config/lsp.lua

local version = vim.version()
local is_new = version.major > 0 or version.minor >= 11

-- Общие LSP-маппинги (работают в обоих режимах)
local function setup_lsp_attach()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
            local bufnr = args.buf
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        end,
    })
end

if is_new then
    -- ============================================================
    -- Neovim 0.11+ : используем встроенный vim.lsp.config
    -- ============================================================
    vim.lsp.config.phpactor = {
        cmd = { 'phpactor', 'language-server' },
        filetypes = { 'php' },
        root_markers = { '.git', 'composer.json' },
        settings = {},
        -- внутри vim.lsp.config.phpactor
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    vim.lsp.enable('phpactor')
    setup_lsp_attach()
    print("LSP: vim.lsp.config (phpactor)")

else
    -- ============================================================
    -- Neovim 0.10 и ниже : используем nvim-lspconfig
    -- ============================================================
    local lspconfig = require('lspconfig')

    -- Функция on_attach для старого API
    local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    end

    lspconfig.phpactor.setup({
        on_attach = on_attach,
        filetypes = { 'php' },
        root_dir = lspconfig.util.root_pattern('.git', 'composer.json'),
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
        }
    })
    print("LSP: nvim-lspconfig (phpactor)")
end
