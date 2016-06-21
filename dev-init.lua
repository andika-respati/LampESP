--Check if AP were not configured, do config_init else run init
--enduser_setup.start(
--  function()
--    print("Connected to Wifi as : " .. wifi.sta.getip())
--  end,
--  function(err,str)
--    print("enduser_setup: Err #" .. err .. ": " .. str)
--  end
--);  

wifi.ap.config({ssid="MySmartLamp",auth=wifi.AUTH_OPEN})
enduser_setup.manual(false)
enduser_setup.start(
  function()
    print("Connected to wifi as:" .. wifi.sta.getip())
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end
);