local module_enduser = {}

function module_enduser.start()
  wifi.setmode(wifi.STATIONAP)  
  print("starting enduser module")
  cfg={}
  cfg.ssid=config.get("ap_ssid")
  cfg.pass=config.get("ap_pass")
  wifi.ap.config(cfg)  
  enduser_setup.manual(true)
  enduser_setup.start(
    function()
      print("Connected to wifi as:"..wifi.sta.getip());
    ssid,pass,bssid_set,bssid=wifi.sta.getconfig();
      config.set("sta_ssid",ssid)
      config.set("sta_pass",pass)
      config.save()
      node.restart()
      wifi.setmode(wifi.STATION)
    end,
    function(err,str)
      print("enduser_setup: Err #"..err..": "..str)
    end
  );
end 

return module_enduser