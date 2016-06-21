if (file.exists("config.json")) then
  config = cjson.decode(file.open("config.json"));
  dofile("init_configured.lua")
else
  data = file.open("default.json")
  dofile()
end