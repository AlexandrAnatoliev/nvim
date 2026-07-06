-- test_timer.lua
local lu = require("luaunit")   -- найдёт ./luaunit.lua

-- Тестовый класс (по соглашению имя должно начинаться с Test)
TestMath = {}

function TestMath:testAddition()
    lu.assertEquals(2 + 2, 4)
end

function TestMath:testSubtraction()
    lu.assertEquals(5 - 3, 2)
end

-- Запуск всех тестов
os.exit(lu.LuaUnit.run())
