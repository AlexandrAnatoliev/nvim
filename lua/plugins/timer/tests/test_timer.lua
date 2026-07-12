-- test_timer.lua
local lu = require("luaunit")   -- найдёт ./luaunit.lua
local timer = require("src.Timer")

-- Тестовый класс (по соглашению имя должно начинаться с Test)
TestTimer = {}

function TestTimer:testNormalizeTime()
  lu.assertEquals(timer.normalize_time(123), "00 h 02 m 03 s")
end
-- Запуск всех тестов
os.exit(lu.LuaUnit.run())
