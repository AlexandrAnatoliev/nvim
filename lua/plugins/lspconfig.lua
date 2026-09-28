return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' }, -- добавляем зависимость
  config = function()
    -- Получаем capabilities от cmp_nvim_lsp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Применяем capabilities ко всем LSP-серверам
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    -- Включаем нужные серверы
    vim.lsp.enable('pyright')
    -- vim.lsp.enable('lua_ls') -- если нужно
  end,
}
