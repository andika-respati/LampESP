function statuswifi()
  print(wifi.getmode());
  print(wifi.ap.getip());
  print(wifi.sta.getip());
end

function resetdummy()
  wifi.setmode(wifi.NULLMODE);
  wifi.setmode(wifi.STATIONAP);
  tmr.delay(500);
  wifi.sta.disconnect();
end

--resetdummy();
--tmr.delay(100);
--wifi.setmode(wifi.SOFTAP);
statuswifi();

--node.restart();