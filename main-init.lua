config = require("module_config")
wifi.setmode(wifi.NULLMODE)
if (file.exists("config.json")) then
  print("config found")
  config.load()
  dofile("main.lua")
else  
  config.init()
  local userstart = require("module_enduser");
  userstart.start();
end