return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Применяем capabilities ко всем LSP-серверам
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    -- Настройка clangd для C++
    vim.lsp.config('clangd', {
      cmd = {
        'clangd',
        '--background-index',          -- индексирует проект в фоне
        '--clang-tidy',                -- включает проверки clang-tidy
        '--header-insertion=iwyu',     -- автодобавление #include
        '--completion-style=detailed', -- подробное автодополнение
        '--function-arg-placeholders', -- подсказки аргументов функций
        '--fallback-style=llvm',       -- стиль форматирования по умолчанию
      },
    })

    vim.lsp.enable('clangd') 
  end,
}
