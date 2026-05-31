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
-- map('i', '<', '<><Left>')

local function get_unclosed_tag()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before_cursor = line:sub(1, col)
  local tag_start, tag_end = before_cursor:find('<[%w-]+$')
  if not tag_start then
    return nil
  end
  return line:sub(tag_start + 1, tag_end)
end

function _G.tag_close()
  local tag = get_unclosed_tag()
  if tag then
    local close = '</' .. tag .. '>'
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '>' .. close })
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  else
    vim.api.nvim_feedkeys('>', 'n', false)
  end
end

map('i', '>', '<Cmd>lua tag_close()<CR>')
