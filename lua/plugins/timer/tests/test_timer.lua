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

function TestTimer:testWriteTime()
    local test_file = "temp_test_time.txt"
    local test_time = 12345

    -- Гарантируем, что файла нет
    os.remove(test_file)

    -- Запись
    timer.write_time(test_file, test_time)

    -- Проверяем, что файл создан
    local file = io.open(test_file, "r")
    lu.assertNotNil(file, "Файл не создан после записи")

    local content = file:read("*a")
    file:close()
    os.remove(test_file)  -- очистка

    local read_time = tonumber(content)
    lu.assertEquals(read_time, test_time, "Записано неверное время")
end

-- Запуск всех тестов
os.exit(lu.LuaUnit.run())
