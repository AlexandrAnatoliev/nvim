-- Подключаем наш модуль один раз
local timer_module = require("plugins.timer.src.Timer") 
-- Обратите внимание: путь зависит от того, указана ли папка timer в runtimepath.
-- Если нет, используйте require("Timer"), положив файл в .../lua/Timer.lua

-- Автокоманда, которая сработает после полной загрузки интерфейса (UIEnter)
-- Это гарантирует, что все плагины тоже загрузились.
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    timer_module.start_timer()
  end,
  once = true -- Чтобы срабатывало только один раз за сессию
})
