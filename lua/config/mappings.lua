vim.g.mapleader = ' '
-- Функция-обёртка для удобства
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true   -- защита от рекурсии
  opts.silent = true    -- не выводить лишние сообщения
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
-- переключение между окнами
map('n', '<Leader>h', ':wincmd h<CR>')  -- влево
map('n', '<Leader>j', ':wincmd j<CR>')  -- вниз
map('n', '<Leader>k', ':wincmd k<CR>')  -- вверх
map('n', '<Leader>l', ':wincmd l<CR>')  -- вправо

-- Автоматическая вставка кавычек и скобочек
map('i', '(', '()<Left>')
map('i', '[', '[]<Left>')
map('i', '{', '{}<Left>')
map('i', '"', '""<Left>')
map('i', "'", "''<Left>")

-- Автоматическое закрытие тегов
map('i', '>', '<Cmd>lua tag_close()<CR>')
