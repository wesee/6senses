# device 4
url="http://api-m2x.att.com/v2/devices"
deviceid="7f2f1f12a606081b79815c9e50e0ac93"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: ce4315b1c9b731f5baf86a4a3d8478ea"


for i in {1..100}
do
echo $i

tilt=$((RANDOM % 20 + 35))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: ce4315b1c9b731f5baf86a4a3d8478ea\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 10
done