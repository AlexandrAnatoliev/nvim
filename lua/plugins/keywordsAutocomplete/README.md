# keywordsAutocomplete

Автодополнение для Lua из пользовательских словарей (опция `dictionary` Neovim).

## Установка

Положи словари в `~/.config/nvim/dicts/`:

- `lua_dict.txt` – ключевые слова (function, local, if…)
- `lua_func.txt` – встроенные функции (print, require, pairs…)

В `init.lua` добавь:

```lua
require('plugins.keywordsAutocomplete')
```

## Использование

В файлах .lua работают стандартные комбинации:

* <C-n> – следующее дополнение
* <C-p> – предыдущее

Меню не появляется автоматически – вызывай вручную.

## Добавление других типов файлов

Вызов в плагине:

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",   -- нужный тип
  callback = function()
    vim.opt_local.dictionary:append("путь/к/словарю.txt")
  end,
})
```

## Проверка

`:set dictionary?` – показывает подключённые словари
`:scriptnames` – виден ли плагин

