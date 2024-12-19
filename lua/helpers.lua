local M = {}

function M.dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. M.dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

function M.writeArr(file)
  local arr = require("tohtml").tohtml()
  local file_descriptor = io.open(file, "w+")
  if file_descriptor == nil then
    print("file is null")
    return
  end
  for key, line in pairs(arr) do
    print(line)
    file_descriptor:write(line)
    file_descriptor:write("\n")
  end
end

return M
