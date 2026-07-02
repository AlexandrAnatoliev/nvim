-- init.lua — точка входа конфигурации Neovim
---1. Добавляем все плагины из pack/plugins/start в runtimepath

local pack_path = vim.fn.stdpath('config') .. '/pack/plugins/start'
for _, name in ipairs(vim.fn.readdir(pack_path)) do
  vim.opt.runtimepath:append(pack_path .. '/' .. name)
end

-- 2. Базовые настройки редактора
require('config.basic-settings')

-- 3. Пользовательские горячие клавиши
require('config.mappings')

-- 4. LSP: настройка серверов и клавиш 
require('config.lsp')

-- 5. Автодополнение (nvim-cmp)
require('config.completion')

-- 6. Прочие плагины / утилиты
require('plugins.auto-tags')
require('plugins.double2single')
require('plugins.keywordsAutocomplete')
require('plugins.timer')
