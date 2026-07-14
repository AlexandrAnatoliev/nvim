-- test_timer.lua
local lu = require("luaunit")   -- найдёт ./luaunit.lua
local timer = require("src.Timer")

TestTimer = {}
-- Корректно преобразует секунды в часы и минуты
function TestTimer:testNormalizeTime()
  lu.assertEquals(timer.normalize_time(123), "00 h 02 m 03 s")
end

-- Корректно обрабатывает несуществующий файл
function TestTimer:testGetTime()
  lu.assertEquals(timer.get_time("invalid/path.txt"), -1)
end

-- Прверяет, что функция возращает осмысленный путь (не пустую строку)
function TestTimer:testGetCurrentDir()
    local dir = timer.get_current_dir()
    lu.assertIsString(dir)
    lu.assertNotEquals(dir, "")
end

-- Запуск всех тестов
os.exit(lu.LuaUnit.run())
