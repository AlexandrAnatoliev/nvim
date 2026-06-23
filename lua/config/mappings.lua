vim.g.mapleader = ' '

-- переключение между окнами
vim.keymap.set('n', '<Leader>h', '<C-w>h',
              { silent = true })  -- влево
vim.keymap.set('n', '<Leader>j', '<C-w>j',
              { silent = true })  -- вниз
vim.keymap.set('n', '<Leader>k', '<C-w>k',
              { silent = true })  -- вверх
vim.keymap.set('n', '<Leader>l', '<C-w>l',
              { silent = true })  -- вправо

-- Автоматическая вставка кавычек и скобочек
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('i', "'", "''<Left>")

-- Автоматическое закрытие тегов
vim.keymap.set('i', '>', function() tag_close() end,
              { silent = true }) 

-- Замена двойных $$ на $
vim.keymap.set('n', '<leader>ds',
    function() replace_double_to_single('$') end,
    { silent = true }) 

-- Переход к маппингам
vim.keymap.set(
  'n', '<Leader>m',
  ':e ~/.config/nvim/README.md<CR>',
  { silent = true })

