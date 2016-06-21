data = {}

port=55055

--local bclistener = require("broadcastadapter");
--local bcsender = require("broadcast")

print("IP:"..wifi.sta.getip()..", Port:"..port)
s=net.createServer(net.UDP) 
s:on("receive", function(sck, rec)
print(sck)
print(rec)
sck:send("rawdata")
end) 
s:listen(port)

--srv:on("receive", function(sck, rec, srcIP)