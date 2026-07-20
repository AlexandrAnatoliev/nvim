# Плагин для подсчета времени работы nvim
version 0.3.0

#### Структура папок
 ```
├── data
│   ├── average_time.txt
│   ├── day_time.txt
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

При заходе в nvim выводит время работы за сутки
```
Run timer
Today: 00 h 05 m 31 s
Average: 00 h 03 m 01 s
Press ENTER or type command to continue    
```
