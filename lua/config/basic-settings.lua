-- Базовые настройки редактора

-- Отображение
vim.opt.number = true               -- Показывать номера строк
vim.opt.relativenumber = true       -- Показывать относительные номера строк

-- Управление отступами и пробелами
vim.opt.tabstop = 2                 -- Ширина таба (визуально)
vim.opt.softtabstop = 2             -- Количество пробелов при нажатии Tab
vim.opt.shiftwidth = 2              -- Количество пробелов для автоотступов (например, при >>)
vim.opt.expandtab = true            -- Вставлять пробелы вместо табуляции

-- Общие удобства
vim.opt.autoindent = true           -- Копировать отступ с предыдущей строки
vim.opt.syntax = "enable"           -- Включить подсветку синтаксиса
vim.opt.scrolloff = 8               -- Минимальное количество строк над/под курсором при прокрутке
vim.opt.clipboard = "unnamedplus"   -- Использовать системный буфер обмена (копировать/вставлять между Neovim и другими приложениями)

-- Определение типов файлов и загрузка плагинов для них
-- Это включает filetype plugin indent on
vim.opt.filetype = "on"

-- Line wrapping and scrolling
vim.opt.wrap = false
vim.opt.sidescroll=8
vim.opt.sidescrolloff=8
vim.opt.scrolloff=8

