-- Старый конфиг
vim.cmd('source ~/.config/nvim/init.vim.bak')

-- Базовые настройки
require("config.basic-settings")

-- Горячие клавиши
require("config.mappings")

-- Автоматическое закрытие тегов
require('plugins.auto-tags')
