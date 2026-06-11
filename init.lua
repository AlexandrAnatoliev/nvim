-- Базовые настройки
require("config.basic-settings")

-- Горячие клавиши
require("config.mappings")

-- Автоматическое закрытие тегов
require('plugins.auto-tags')

-- Замена двойных $$ на $
require('plugins.double2single')

-- Добавить один файл
-- vim.opt.dictionary:append("~/.config/nvim/dicts/lua_dict.txt")

-- Или сразу несколько через запятую
-- vim.opt.dictionary:prepend("~/.dicts/tech.txt,~/.dicts/names.txt")

-- vim.opt.complete:append("k")   -- 'k' включает источник dictionary
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.dictionary:append("~/.config/nvim/dicts/lua_dict.txt")
  end,
})

-- Подключаем плагин lspconfig
-- Эта строка сообщает Neovim, где искать lua-модули.
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/pack/plugins/start/nvim-lspconfig')
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/pack/plugins/start/plenary.nvim')

-- Загружаем модуль lspconfig
local lspconfig = require('lspconfig')

-- После require('lspconfig')
require('config.lsp')  -- или require('configs.lsp') в зависимости от имени файла/папки

-- В init.lua, после всех require, но до загрузки completion
local pack_path = vim.fn.stdpath('config') .. '/pack/plugins/start'
for _, name in ipairs(vim.fn.readdir(pack_path)) do
    vim.opt.runtimepath:append(pack_path .. '/' .. name)
end
require('config/completion')
