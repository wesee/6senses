# device 5
url="http://api-m2x.att.com/v2/devices"
deviceid="dc7bd16d0e4cdfa2389018befa9ef0a7"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: 287874d0f6c748f7e1f5398ee57fa905"


for i in {1..50}
do
echo $i

tilt=$((RANDOM % 20 + 35))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: 287874d0f6c748f7e1f5398ee57fa905\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 5
done