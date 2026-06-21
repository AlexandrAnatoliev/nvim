-- ~/.config/nvim/lua/config/lsp.lua
-- Настройка LSP (встроенное в Neovim)

-- Функция, создающая автокоманды для назначения
-- клавиш при подключении LSP-клиента
local function setup_lsp_keymaps()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup(
      'UserLspConfig', 
      { clear = true }
    ),
    callback = function(args)
      local bufnr = args.buf
      local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true
      }

      -- Переходы к определению
      vim.keymap.set(
        'n', 'gd', vim.lsp.buf.definition, opts)

      -- Информация о слове под курсором
      vim.keymap.set(
        'n', 'K', vim.lsp.buf.hover, opts)

      -- Переход к реализации интерфейса
      vim.keymap.set(
        'n', 'gi', vim.lsp.buf.implementation,
        opts)

      -- Переименовать символ
      vim.keymap.set(
        'n', '<leader>rn', vim.lsp.buf.rename,
        opts)

      -- Показать все использования
      vim.keymap.set(
        'n', 'gr', vim.lsp.buf.references, opts)
      
      -- Открыть меню code actions 
      -- (быстрые исправления)
      vim.keymap.set(
        'n', '<leader>ca',
        vim.lsp.buf.code_action, opts)

      -- Предыдущая ошибка
      vim.keymap.set(
        'n', '[d', vim.diagnostic.goto_prev,
        opts)

      -- Следующая ошибка
      vim.keymap.set(
        'n', ']d', vim.diagnostic.goto_next,
        opts)

      -- Окно с деталями диагностики
      vim.keymap.set(
        'n', '<leader>e',
        vim.diagnostic.open_float, opts)
    end,
  })
end

-- Настройка сервера phpactor
vim.lsp.config.phpactor = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json' },
  settings = {},
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- Включаем phpactor
vim.lsp.enable('phpactor')

-- Включаем клавиши для всех LSP-серверов
setup_lsp_keymaps()
print("LSP: vim.lsp.config (phpactor)")

