local module_udp = {}
local server = net.createServer(net.UDP)
local data = {}

local function bcreceived(sck,rec)
  print(sck)
  print(rec)
  --reply
  data["hostname"] = config.get("hostname");  
  data["ip"], net, gate= wifi.sta.getip();  
  sck:send(cjson.encode(data))  
end

function module_udp.startbclistener(port)
  server:on("receive" , bcreceived)
  server:listen(port)
end

function module_udp.testothermodule()
  print(config.get("ap_ssid"))
end


--port=55055
--local bclistener = require("broadcastadapter");
--local bcsender = require("broadcast")

--print("IP:"..wifi.sta.getip()..", Port:"..port)
--s=net.createServer(net.UDP) 
--s:on("receive", function(sck, rec)
--print(sck)
--print(rec)
--sck:send("rawdata")
--end) 
--s:listen(port)

--srv:on("receive", function(sck, rec, srcIP)

return module_udp