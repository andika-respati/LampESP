local module_config = {}

function module_config.set(k, v)
  module_config[k] = v;
end

function module_config.get(k)
  return module_config[k];
end

function module_config.save()
  file.open("config.json", "w+");
  file.write(cjson.encode(module_config));
  file.close();
end

function module_config.init()
  file.open("default.json");
  module_config = cjson.decode(file.read());
  file.close();
end

function module_config.load()
  file.open("config.json");
  module_config = cjson.decode(file.read());
  wifi.setmode(wifi.STATION);  
  wifi.sta.disconnect()
  file.close();
  --wifi.sta.config(configmodule.get("sta_ssid"), configmodule.get("sta_pass"));
  --wifi.sta.connect();
end

function module_config.printt()
  local t = module_config;
  for k,v in pairs(t) do print(k,v) end
end

function module_config.prints()
  file.open("config.json");
  print (file.read());
  file.close()
end

function module_config.reset()
  file.remove("config.json");  
  node.restart()
end

return module_config;