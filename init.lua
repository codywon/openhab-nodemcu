dofile("config.lua")

print("Connecting to '"..SSID.."' ...");
wifi.setmode(wifi.STATION)
wifi.sta.config(SSID,PASSWORD)
wifi.sta.connect()

dofile("servernode.lua")
dofile("mqtt.lua")


