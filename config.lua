configmodule = {}

function configmodule.set(k, v)
  configmodule[k] = v;
end

function configmodule.get(k)
  return configmodule[k];
end

function configmodule.save()
  file.open("config.json", "w+");
  file.write(cjson.encode(configmodule));
  file.close();
end

function configmodule.init()
  file.open("default.json");
  configmodule = cjson.decode(file.read());
  file.close();
  local basicsetup = require("init_def");
  print("Starting User Setup");
  basicsetup.start();
end

function configmodule.load()
  file.open("config.json");
  configmodule = cjson.decode(file.read());
  wifi.setmode(wifi.STATION);
  file.close();
  wifi.sta.config(configmodule.get("sta_ssid"), configmodule.get("sta_pass"));
  wifi.sta.connect();
end

function configmodule.printt()
  local t = config;
  for k,v in pairs(t) do print(k,v) end
end

function configmodule.prints()
  file.open("config.json");
  print (file.read());
  file.close()
end

function configmodule.reset()
  file.remove("config.json");  
  node.restart()
end

return configmodule;