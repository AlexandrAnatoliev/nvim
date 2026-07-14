local M = {}

function M.start_timer()

  local current_dir = debug.getinfo(1, "S").source
  local current_dir = string.match(current_dir, "^@(.+)/[^/]+$")

  if not current_dir or current_dir == "" then
    current_dir = "."
  end

  local start_time = os.time()

  local start_file_path = current_dir .. "/../data/start_time.txt"
  local stop_file_path = current_dir .. "/../data/stop_time.txt"

  local start = M.get_time(start_file_path)
  local stop = M.get_time(stop_file_path)

  if start and stop then
    local time = M.normalize_time(stop - start)
    print("past session:", time)
  end

  local file, err = io.open(start_file_path, "w")
  if not file then
    print("Ошибка при открытии файла" .. err)
    return
  end

  file:write(start_time)
  file:close()
end

function M.stop_timer()
  local current_dir = debug.getinfo(1, "S").source
  local current_dir = string.match(current_dir, "^@(.+)/[^/]+$")

  if not current_dir or current_dir == "" then
    current_dir = "."
  end

  local stop_time = os.time()

  local stop_file_path = current_dir .. "/../data/stop_time.txt"
  local file, err = io.open(stop_file_path, "w")
  if not file then
    print("Ошибка при открытии файла" .. err)
    return
  end

  file:write(stop_time)
  file:close()
end

--- Преобразует время в секундах в читаемый строковый формат.
-- @param in_sec (number) Количество секунд (целое >= 0)
-- @return (string) Отформатированная строка вида "00 h 02 m 03 s"
-- @usage print(M.normalize_time(123)) --> "00 h 02 m 03 s"
function M.normalize_time(in_sec)
  local hour = math.floor(in_sec / 3600)
  local min =  math.floor((in_sec % 3600) / 60)
  local sec = in_sec % 60
  return string.format("%02.0f h %02.0f m %02.0f s", hour, min, sec)
end

--- Возвращает время в секундах, записанное в файл
-- @param file_path (string) Путь до файла
-- @return (number) Записанное время в секундах (целое >= 0)
-- @usage print(M.get_time("start_time.txt")) --> 123
function M.get_time(file_path)
  local file = io.open(file_path, "r")
  local time = -1
  if file then
    local content = file:read("*a")
    file:close()
    time = tonumber(content)
  end
  return time or -1
end

--- Возвращает путь до текущей директории в виде строки
-- @return (string) Путь до текущей директории
-- @usage print(M.get_current_dir()) --> "/home/user/project/src"
function M.get_current_dir()
  local src = debug.getinfo(1, "S").source
  local dir = string.match(src, "^@(.+)/[^/]+$")

  if not dir or dir == "" then
    dir = "."
  end
  return dir
end

return M
