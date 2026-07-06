local lu = require("luaunit")

-- подключаем тестовые файлы
require("test_math")
require("test_strings")

os.exit(lu.LuaUnit.run())
