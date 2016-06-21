config = {};

function config_save()
  file.open("config.json", "w+");
  file.write(cjson.encode(config));
  file.close();
end

function conf_init()
  print("conf_init Run");
  file.open("config.json");
  config = cjson.decode(file.read());
  file.close();
  --dofile("init_conf.lua");
end

function defa_init()  
  print("defa_init Run");
  file.open("default.json");
  str = file.read();
  config = cjson.decode(str);
  file.close();
  --dofile("init_def.lua");
end

function soft_reset()
  file.remove("config.json");  
  node.restart()
end

function config_print()
  t = config;
  for k,v in pairs(t) do print(k,v) end
end

function config_printj()
  file.open("config.json");
  b = cjson.decode(file.read());
  file.close()
  print (b);
end