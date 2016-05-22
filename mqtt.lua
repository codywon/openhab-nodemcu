

function wifiConnected()
    if wifi.sta.getip() ~= nil then
        print("i\twifi\t1");
    else
        print("i\twifi\t0");
    end
end

mq = mqtt.Client(NAME, 120)
-- mq:lwt("/lastwill", "offline", 0, 0)
mq:on("connect", function(con) print ("i\tmqtt\t1") end)
mq:on("offline", function(con) print ("i\tmqtt\t0") end)
-- on publish message receive event
mq:on("message", function(conn, topic, data)
  if data ~= nil then
    print("m\t"..topic.."\t"..data)
  end
end)

function mqConnect()
    mq:connect(MQTT_BROKER, MQTT_PORT, 0, 0)
end

function mqClose()
    mq:close();
end

function mqSubscribe(topic)
    mq:subscribe(topic, 0, function(conn) print("i\tsub\t1") end);
end

function mqPublish(topic, data)
    mq:publish(topic, data, 0, 0, function(conn) print("i\tpublish\t1") end);
end

function getIpAddr()
    ip = wifi.sta.getip()
    print("i\tip\t"..ip)
end

