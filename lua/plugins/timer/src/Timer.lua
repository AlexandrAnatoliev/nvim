local M = {}

function M.start_timer()
  print("Run timer2\n")

  local current_dir = debug.getinfo(1, "S").source
  local current_dir = string.match(current_dir, "^@(.+)/[^/]+$")

  if not current_dir or current_dir == "" then
    current_dir = "."
  end

  local start_time = os.time()

  local start_file_path = current_dir .. "/../data/start_time.txt"

  local file = io.open(start_file_path, "r")
    if file then
      local content = file:read("*a")     -- всё содержимое как строка
      file:close()
      local number = tonumber(content)
      if number then
        print("Число:", number)
        print("\n")
    end
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

return M
