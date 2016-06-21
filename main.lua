wifi.sta.config(config.get("sta_ssid"), config.get("sta_pass"));
wifi.sta.connect();
print(wifi.sta.getip())

udp_adapter = require("module_udp");
udp_adapter.startbclistener(55055);