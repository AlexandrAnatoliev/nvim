-- Старый конфиг
-- vim.cmd('source ~/.config/nvim/init.vim.bak')
 
-- Базовые настройки
require("config.basic-settings")

-- Горячие клавиши
require("config.mappings")

-- Автоматическое закрытие тегов
require('plugins.auto-tags')

-- Замена двойных $$ на $
require('plugins.double2single')

-- Подключаем плагин lspconfig
-- Эта строка сообщает Neovim, где искать lua-модули.
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/pack/plugins/start/nvim-lspconfig')
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/pack/plugins/start/plenary.nvim')

-- Загружаем модуль lspconfig
local lspconfig = require('lspconfig')

-- После require('lspconfig')
require('config.lsp')  -- или require('configs.lsp') в зависимости от имени файла/папки

