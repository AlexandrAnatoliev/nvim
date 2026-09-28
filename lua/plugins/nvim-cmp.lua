-- ~/.config/nvim/lua/plugins/nvim-cmp.lua
return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  -- Зависимости (источники автодополнения)
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- Источник для LSP
    "hrsh7th/cmp-buffer",        -- Источник для слов из буфера
    "hrsh7th/cmp-path",          -- Источник для путей к файлам
    "hrsh7th/cmp-cmdline",       -- Источник для командной строки
    "L3MON4D3/LuaSnip",          -- Движок для сниппетов
    "saadparwaiz1/cmp_luasnip",  -- Источник для сниппетов
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Загружаем сниппеты из VS Code
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      -- Настройка сниппетов
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Настройка клавиш
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Принять выбор по Enter
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- Настройка источников
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
