-- ~/.config/nvim/lua/config/completion.lua

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- Для vim-vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),  -- вручную вызвать дополнение
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Enter выбирает пункт
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },      -- LSP (phpactor)
    { name = 'vsnip' },         -- сниппеты (если используете vsnip)
    { name = 'buffer' },        -- слова из открытых буферов
    { name = 'path' },          -- пути к файлам
  }),
})

-- Настройка автодополнения для командной строки (опционально)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

print("Completion loaded")
