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

  local file = io.open(start_file_path, "r")
  if file then
    local content = file:read("*a")     -- всё содержимое как строка
    file:close()
    start = tonumber(content)
  end

  local file = io.open(stop_file_path, "r")
  if file then
    local content = file:read("*a")     -- всё содержимое как строка
    file:close()
    stop = tonumber(content)
  end

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
-- @usage print(normalize_time(123)) --> "00 h 02 m 03 s"
function M.normalize_time(in_sec)
  local hour = math.floor(in_sec / 3600)
  local min =  math.floor((in_sec % 3600) / 60)
  local sec = in_sec % 60
  return string.format("%02.0f h %02.0f m %02.0f s", hour, min, sec)
end

return M
