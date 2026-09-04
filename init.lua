-- init.lua — точка входа конфигурации Neovim

require("config.lazy")

-- 2. Базовые настройки редактора
require('config.basic-settings')

-- 3. Пользовательские горячие клавиши
require('config.mappings')

require('timer')
