# Плагин замены двойных символов на одинарные
version 0.1.0

#### Структура папок
 ```
 ~/.config/nvim/lua/plugins/double2single/init.lua
 ```

#### Конфигурация:

Добавить в `/.config/nvim/init.lua`:
```
require('plugins.double2single')
```

#### Использование

```
map('n', '<leader>ds', '<Cmd>lua replace_double_to_single("$")<CR>')
```
