# Плагин для автоматического закрытия тегов
version 0.1.0

#### Структура папок
 ```
 ~/.config/nvim/lua/plugins/auto-tags/init.lua
 ```

#### Конфигурация:

Добавить в `/.config/nvim/init.lua`:
```
require('plugins.auto-tags')
```

#### Использование

```
vim.api.nvim_set_keymap('i', '>', '<Cmd>lua tag_close()<CR>')
```
