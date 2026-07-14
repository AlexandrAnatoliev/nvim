# Плагин для подсчета времени последней сессии работы nvim
version 0.1.0

#### Структура папок
 ```
├── data
│   ├── start_time.txt
│   └── stop_time.txt
├── init.lua
├── README.md
├── src
│   └── Timer.lua
└── tests
    └── test_timer.lua
 ```

#### Конфигурация:

Добавить в `/.config/nvim/init.lua`:
```
require('plugins.timer')
```

#### Использование

При заходе в nvim выводит временя последней сессии
```
Run timer
past session: 00 h 05 m 31 s
Press ENTER or type command to continue    
```
